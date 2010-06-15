// Author:  Yang Juyuan
// Date:    2010.6.11
// 

using System;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using BLOOM.Web.Models.Book;
using BLOOM.Web.Models.User;

namespace BLOOM.Web.Models.Analyse
{
    // ----------- statistics about users -----------
    public struct m_ageRange
    {
        public int age;
        public int count;   // the number of people of the same age
    };

    public struct m_genderRange
    {
        public string gender; // true means male~
        public int count;   // the number of people of the same gender
    };

    public struct m_occupationRange
    {
        public string occupation;
        public int count;   // the number of people of the same occupation
    };

    public struct m_createDateRange
    {
        public DateTime createDate;
        public int count;   // the number of people of the same createDate
    };

    // ----------- statistics about money earned-----------
    public struct m_moneyByAge
    {
        public int age;
        public Decimal money;
    };

    public struct m_moneyByGender
    {
        public string gender;
        public Decimal money;
    };

    public struct m_moneyByOccupation
    {
        public string occupation;
        public Decimal money;
    };

    public struct m_moneyByCategory
    {
        public int categoryId;
        public Decimal money;
    };

    // ----------- statistics about BooksViewed & BooksBought -----------
    public struct m_boughtTimes
    {
        public int bookId;
        public string title;
        public int boughtTimes;
    };

    public struct m_viewedTimes
    {
        public int bookId;
        public string title;
        public int viewedTimes;
    };

    public struct m_categoryBoughtTimes
    {
        public int categoryId;
        public int boughtTimes;
    };

    public struct m_categoryViewedTimes
    {
        public int categoryId;
        public int viewedTimes;
    };

    public struct m_categoryStatistice
    {
        public int categoryId;
        public int count;
    };

    // --------------- Analsye Class ----------------
    public class Analyse
    {

        //  public :
        public Analyse()
        {
            m_analyseDataContext = new AnalyseLinqConnectionDataContext();  //instantiate a analyse context class
        }

        // ---------------- Recommend books to readers ----------------
        public IQueryable<book_BookInfo> RecommendBooks(Guid userId)
        {
            UserRepository userRepository = new UserRepository();
            var aimUser = (from user in m_analyseDataContext.aspnet_Membership
                         where user.UserId == userId
                         select user).First();
            if (aimUser.Age.HasValue == true)
            {
                var result = from readRecord in m_analyseDataContext.book_BookBought
                             from user in m_analyseDataContext.aspnet_Membership
                             where ( (user.Age.HasValue == true 
                                      && user.Age <= aimUser.Age + 5
                                      && user.Age >= aimUser.Age - 5) 
                                  || (user.Age.HasValue == false
                                      && user.Occupation == aimUser.Occupation))
                             select readRecord.book_BookInfo;
                if (result.Count() < TopFive().Count())
                    return TopFive();
                else
                    return result;
            }
            else 
            {
                var result = from readRecord in m_analyseDataContext.book_BookBought
                             from user in m_analyseDataContext.aspnet_Membership
                             where user.Occupation == aimUser.Occupation
                             select readRecord.book_BookInfo;
                if (result.Count() < TopFive().Count())
                    return TopFive();
                else
                    return result;
            }
        }

        // ---------------- for administrator to analyse ----------------

        // ----------- 1  statistics about users -----------
        public List<m_ageRange> GetAgeStatistics()  // return pairs of age and the number of people of the same age
        {
            var groupResult = from user in m_analyseDataContext.aspnet_Membership
                              where user.Age.HasValue == true
                              group user by user.Age into ageGroups
                              orderby ageGroups.First().Age
                              select new
                              {
                                  age = ageGroups.Key.GetValueOrDefault(0),
                                  count = ageGroups.Count()
                              };
            List<m_ageRange> result = new List<m_ageRange>();
            foreach (var res in groupResult)
            {
                m_ageRange temp = new m_ageRange();
                temp.age = res.age;
                temp.count = res.count;
                result.Add(temp);
            }
            return result;
        }

        public List<m_genderRange> GetGenderStatistics()  // return pairs of gender and the number of people of the same gender
        {
            var groupResult = from user in m_analyseDataContext.aspnet_Membership
                              where user.Gender.HasValue == true
                              group user by user.Gender into genderGroups
                              select new
                              {
                                  gender = genderGroups.Key.GetValueOrDefault(true),
                                  count = genderGroups.Count()
                              };
            List<m_genderRange> result = new List<m_genderRange>();
            foreach (var res in groupResult)
            {
                m_genderRange temp = new m_genderRange();
                temp.gender = res.gender ? "男" : "女";
                temp.count = res.count;
                result.Add(temp);
            }
            return result;
        }

        public List<m_occupationRange> GetOccupationStatistics()  // return pairs of occupation and the number of people of the same occupation
        {
            var groupResult = from user in m_analyseDataContext.aspnet_Membership
                              where user.Occupation != ""  // can be deleted
                              group user by user.Occupation into occupationGroups
                              select new
                              {
                                  occupationGroups.Key,
                                  count = occupationGroups.Count()
                              };
            List<m_occupationRange> result = new List<m_occupationRange>();
            foreach (var res in groupResult)
            {
                m_occupationRange temp = new m_occupationRange();
                temp.occupation = res.Key;
                temp.count = res.count;
                result.Add(temp);
            }
            return result;
        }

        public List<m_createDateRange> GetCreateDateStatistics()  // return pairs of occupation and the number of people of the same occupation
        {
            var groupResult = from user in m_analyseDataContext.aspnet_Membership
                              group user by user.CreateDate.Date into createDateGroups
                              select new
                              {
                                  createDateGroups.Key,
                                  count = createDateGroups.Count()
                              };
            List<m_createDateRange> result = new List<m_createDateRange>();
            foreach (var res in groupResult)
            {
                m_createDateRange temp = new m_createDateRange();
                temp.createDate = res.Key;
                temp.count = res.count;
                result.Add(temp);
            }
            return result;
        }

        public int GetPeopleWithoutAge()    // the number of people who hasn't enter his age when register
        // can be changed to return who they are
        {
            var result = from user in m_analyseDataContext.aspnet_Membership
                         where user.Age.HasValue == false
                         select user;
            return result.Count();
        }

        // ----------- 2 statistics about categories -----------
        public List<m_categoryStatistice> GetCategoryStatistics()
        {
            var groupResult = from belong in m_analyseDataContext.book_BooksBelong
                         group belong by belong.CategoryId into categoryGroups
                         select new
                         {
                             categoryGroups.Key,
                             count = categoryGroups.Count()
                         };
            List<m_categoryStatistice> result = new List<m_categoryStatistice>();
            foreach (var res in groupResult)
            {
                m_categoryStatistice temp = new m_categoryStatistice();
                temp.categoryId = res.Key;
                temp.count = res.count;
                result.Add(temp);
            }
            return result;
        }

        // ----------- 3 statistics about money earned -----------
        // sql server的 money 类型其实就是小数类型 decimal,其精度较高，所以可以用来存储钱~
        public Decimal GetMoneyStatistics()  // total money earned
        {
            Decimal totalMoney = 0;
            var boughtRecord = from record in m_analyseDataContext.book_BookBought
                               select record;
            foreach(book_BookBought record in boughtRecord)
            {
                totalMoney += Convert.ToDecimal(record.MoneyPaid);
            }
            return totalMoney;
        }

        public Decimal GetMoneyStatistics(DateTime startDate)  // total money earned since startDate
        {
            Decimal totalMoney = 0;
            var boughtRecord = from record in m_analyseDataContext.book_BookBought
                               where record.PurchaseDate > startDate
                               select record;
            foreach(book_BookBought record in boughtRecord)
            {
                totalMoney += Convert.ToDecimal(record.MoneyPaid);
            }
            return totalMoney;
        }    
    
        public List<m_moneyByAge> GetMoneyByAgeStatistics()  // total money earned from people of the same age
        {
            UserRepository userRepository = new UserRepository();
            var groupResult = from record in m_analyseDataContext.book_BookBought
                              join user in m_analyseDataContext.aspnet_Membership
                              on record.UserId equals user.UserId
                              where user.Age.HasValue == true
                              group record by user.Age.GetValueOrDefault(0) into ageGroups
                              select new
                              {
                                  ageGroups.Key,
                                  totalMoney = ageGroups.Sum(user => user.MoneyPaid)
                              };
            groupResult.OrderBy(group => group.Key);
            List<m_moneyByAge> result = new List<m_moneyByAge>();
            foreach(var res in groupResult)
            {
                m_moneyByAge temp = new m_moneyByAge();
                temp.age = res.Key;
                temp.money = res.totalMoney;
                result.Add(temp);
            }
            return result;
        }

        public List<m_moneyByAge> GetMoneyByAgeStatistics(DateTime startDate)  // total money earned from people of the same age since startDate
        {
            UserRepository userRepository = new UserRepository();
            var groupResult = from record in m_analyseDataContext.book_BookBought
                              where record.PurchaseDate > startDate
                              from user in m_analyseDataContext.aspnet_Membership
                              where record.UserId == user.UserId
                              where user.Age.HasValue == true
                              group record by user.Age.GetValueOrDefault(0) into ageGroups
                              select new
                              {
                                  ageGroups.Key,
                                  totalMoney = ageGroups.Sum(user => user.MoneyPaid)
                              };
            groupResult.OrderBy(group => group.Key);
            List<m_moneyByAge> result = new List<m_moneyByAge>();
            foreach (var res in groupResult)
            {
                m_moneyByAge temp = new m_moneyByAge();
                temp.age = res.Key;
                temp.money = res.totalMoney;
                result.Add(temp);
            }
            return result;
        }

        public List<m_moneyByGender> GetMoneyByGenderStatistics()  // total money earned from people of the same gender
        {
            UserRepository userRepository = new UserRepository();
            var groupResult = from record in m_analyseDataContext.book_BookBought
                              from user in m_analyseDataContext.aspnet_Membership
                              where record.UserId == user.UserId
                              where user.Gender.HasValue == true
                              group record by user.Gender.GetValueOrDefault(true) into genderGroups
                              select new
                              {
                                  genderGroups.Key,
                                  totalMoney = genderGroups.Sum(user => user.MoneyPaid)
                              };
            List<m_moneyByGender> result = new List<m_moneyByGender>();
            foreach(var res in groupResult)
            {
                m_moneyByGender temp = new m_moneyByGender();
                temp.gender = res.Key ? "男" : "女";
                temp.money = res.totalMoney;
                result.Add(temp);
            }
            return result;
        }

        public List<m_moneyByGender> GetMoneyByGenderStatistics(DateTime startDate)  // total money earned from people of the same gender since startDate
        {
            UserRepository userRepository = new UserRepository();
            var groupResult = from record in m_analyseDataContext.book_BookBought
                              where record.PurchaseDate > startDate
                              from user in m_analyseDataContext.aspnet_Membership
                              where record.UserId == user.UserId
                              where user.Gender.HasValue == true
                              group record by user.Gender.GetValueOrDefault(true) into genderGroups
                              select new
                              {
                                  genderGroups.Key,
                                  totalMoney = genderGroups.Sum(user => user.MoneyPaid)
                              };
            List<m_moneyByGender> result = new List<m_moneyByGender>();
            foreach(var res in groupResult)
            {
                m_moneyByGender temp = new m_moneyByGender();
                temp.gender = res.Key ? "男" : "女";
                temp.money = res.totalMoney;
                result.Add(temp);
            }
            return result;
        }

        public List<m_moneyByOccupation> GetMoneyByOccupationStatistics()  // total money earned from people of the same occupation
        {
            UserRepository userRepository = new UserRepository();
            var groupResult = from record in m_analyseDataContext.book_BookBought
                              from user in m_analyseDataContext.aspnet_Membership
                              where user.Occupation != "" // can be deleted
                              where record.UserId == user.UserId
                              group record by user.Occupation into occupationGroups
                              select new
                              {
                                  occupationGroups.Key,
                                  totalMoney = occupationGroups.Sum(user => user.MoneyPaid)
                              };
            List<m_moneyByOccupation> result = new List<m_moneyByOccupation>();
            foreach(var res in groupResult)
            {
                m_moneyByOccupation temp = new m_moneyByOccupation();
                temp.occupation = res.Key;
                temp.money = res.totalMoney;
                result.Add(temp);
            }
            return result;
        }

        public List<m_moneyByOccupation> GetMoneyByOccupationStatistics(DateTime startDate)  
            // total money earned from people of the same Occupation since startDate
        {
            UserRepository userRepository = new UserRepository();
            var groupResult = from record in m_analyseDataContext.book_BookBought
                              where record.PurchaseDate > startDate
                              from user in m_analyseDataContext.aspnet_Membership
                              where user.Occupation != "" // can be deleted
                              where record.UserId == user.UserId
                              group record by user.Occupation into occupationGroups
                              select new
                              {
                                  occupationGroups.Key,
                                  totalMoney = occupationGroups.Sum(user => user.MoneyPaid)
                              };
            List<m_moneyByOccupation> result = new List<m_moneyByOccupation>();
            foreach(var res in groupResult)
            {
                m_moneyByOccupation temp = new m_moneyByOccupation();
                temp.occupation = res.Key;
                temp.money = res.totalMoney;
                result.Add(temp);
            }
            return result;
        }

        public List<m_moneyByCategory> GetMoneyByCategoryStatistics()  // total money earned from people of the same category
        {
            BookRepository bookRepository = new BookRepository();
            var groupResult = from record in m_analyseDataContext.book_BookBought
                              from belong in m_analyseDataContext.book_BooksBelong
                              where record.BookId == belong.BookId
                              group record by belong.CategoryId into categoryGroups
                              select new
                              {
                                  categoryGroups.Key,
                                  totalMoney = categoryGroups.Sum(book => book.MoneyPaid)
                              };
            List<m_moneyByCategory> result = new List<m_moneyByCategory>();
            foreach (var res in groupResult)
            {
                m_moneyByCategory temp = new m_moneyByCategory();
                temp.categoryId = res.Key;
                temp.money = res.totalMoney;
                result.Add(temp);
            }
            return result;
        }

        public List<m_moneyByCategory> GetMoneyByCategoryStatistics(DateTime startDate)
            // total money earned from people of the same category since startDate
        {
            BookRepository bookRepository = new BookRepository();
            var groupResult = from record in m_analyseDataContext.book_BookBought
                              from belong in m_analyseDataContext.book_BooksBelong
                              where record.PurchaseDate > startDate
                              where record.BookId == belong.BookId
                              group record by belong.CategoryId into categoryGroups
                              select new
                              {
                                  categoryGroups.Key,
                                  totalMoney = categoryGroups.Sum(book => book.MoneyPaid)
                              };
            List<m_moneyByCategory> result = new List<m_moneyByCategory>();
            foreach (var res in groupResult)
            {
                m_moneyByCategory temp = new m_moneyByCategory();
                temp.categoryId = res.Key;
                temp.money = res.totalMoney;
                result.Add(temp);
            }
            return result;
        }

        // ----------- 4 statistics about BooksViewed & BooksBought -----------
        public List<m_boughtTimes> GetBooksByBoughtTimes()  // statistics of the total bought times
        {
            var bookResult = from book in m_analyseDataContext.book_BookInfo
                             orderby book.BoughtTimes descending
                             select new
                             {
                                 book.BookId,
                                 book.Title,
                                 book.BoughtTimes
                             };
            List<m_boughtTimes> result = new List<m_boughtTimes>();
            foreach (var res in bookResult)
            {
                m_boughtTimes temp = new m_boughtTimes();
                temp.bookId = res.BookId;
                temp.title = res.Title;
                temp.boughtTimes = res.BoughtTimes;
                result.Add(temp);
            }
            return result;
        }

        public List<m_boughtTimes> GetBooksByBoughtTimes(DateTime startDate)  // statitics of the bought times since datetime
        {
            var bookResult = from boughId in m_analyseDataContext.book_BookBought
                             where boughId.PurchaseDate > startDate
                             group boughId by boughId.BookId into groupedBooks
                             orderby groupedBooks.Count() descending
                             select new
                             {
                                 groupedBooks.First().book_BookInfo.BookId,
                                 groupedBooks.First().book_BookInfo.Title,
                                 count = groupedBooks.Count()
                             };
            List<m_boughtTimes> result = new List<m_boughtTimes>();
            foreach (var res in bookResult)
            {
                m_boughtTimes temp = new m_boughtTimes();
                temp.bookId = res.BookId;
                temp.title = res.Title;
                temp.boughtTimes = res.count;
                result.Add(temp);
            }
            return result;
        }

        public List<m_categoryBoughtTimes> GetBooksByCategoryAndBoughtTimes()  // statistics of the total bought times of each category
        {
            var groupResult = from book in m_analyseDataContext.book_BookInfo
                              from belong in m_analyseDataContext.book_BooksBelong
                              where book.BookId == belong.BookId
                              group book by belong.CategoryId into booksGroup
                              select new
                              {
                                  booksGroup.Key,
                                  count = booksGroup.Sum(book => book.BoughtTimes)
                              };
            groupResult.OrderByDescending(group => group.count);
            List<m_categoryBoughtTimes> result = new List<m_categoryBoughtTimes>();
            foreach (var res in groupResult)
            {
                m_categoryBoughtTimes temp = new m_categoryBoughtTimes();
                temp.categoryId = res.Key;
                temp.boughtTimes = res.count;
                result.Add(temp);
            }
            return result;
        }

        public List<m_categoryBoughtTimes> GetBooksByCategoryAndBoughtTimes(DateTime startTime)
            // statistics of the total bought times of each category since startTime
        {
            var groupResult = from bought in m_analyseDataContext.book_BookBought
                              from belong in m_analyseDataContext.book_BooksBelong
                              where bought.PurchaseDate >startTime
                              where belong.BookId == bought.BookId
                              group bought by belong.CategoryId into booksGroup
                              select new
                              {
                                  booksGroup.Key,
                                  count = booksGroup.Count()
                              };
            List<m_categoryBoughtTimes> result = new List<m_categoryBoughtTimes>();
            foreach (var res in groupResult)
            {
                m_categoryBoughtTimes temp = new m_categoryBoughtTimes();
                temp.categoryId = res.Key;
                temp.boughtTimes = res.count;
                result.Add(temp);
            }
            return result;
        }

        public List<m_viewedTimes> GetBooksByViewedTimes()  // statistics of the total viewed times
        {
            var bookResult = from book in m_analyseDataContext.book_BookInfo
                             orderby book.ViewedTimes descending
                             select new
                             {
                                 book.BookId,
                                 book.Title,
                                 book.ViewedTimes
                             };
            List<m_viewedTimes> result = new List<m_viewedTimes>();
            foreach (var res in bookResult)
            {
                m_viewedTimes temp = new m_viewedTimes();
                temp.bookId = res.BookId;
                temp.title = res.Title;
                temp.viewedTimes = res.ViewedTimes;
                result.Add(temp);
            }
            return result;
        }

        public List<m_categoryViewedTimes> GetBooksByCategoryAndViewedTimes()  // statistics of the total viewed times of each category
        {
            var groupResult = from book in m_analyseDataContext.book_BookInfo
                              from belong in m_analyseDataContext.book_BooksBelong
                              where book.BookId == belong.BookId
                              group book by belong.CategoryId into booksGroup
                              select new
                              {
                                  booksGroup.Key,
                                  count = booksGroup.Sum(book => book.ViewedTimes)
                              };
            groupResult.OrderByDescending(group => group.count);
            List<m_categoryViewedTimes> result = new List<m_categoryViewedTimes>();
            foreach (var res in groupResult)
            {
                m_categoryViewedTimes temp = new m_categoryViewedTimes();
                temp.categoryId = res.Key;
                temp.viewedTimes = res.count;
                result.Add(temp);
            }
            return result;
        }

        // our datebase can't caculate the viewed times since some starttime

        // ---------------   For Home Page   --------------
        public IQueryable<book_BookInfo> NewBooks()  // the latest 5 books added
        {
            var result = (from book in m_analyseDataContext.book_BookInfo
                          orderby book.BookId descending
                          select book).Take(5);
            return result;
        }

        public IQueryable<book_BookInfo> HotBooks()
        {
            var result = (from book in m_analyseDataContext.book_BookInfo
                          orderby book.BoughtTimes descending
                          select book).Take(5);
            return result;
        }

        public IQueryable<book_BookInfo> TopFive()
        {
            var result = (from book in m_analyseDataContext.book_BookInfo
                          orderby (book.BoughtTimes * 10 + book.ViewedTimes) descending
                          select book).Take(5);
            return result;
        }

        // private:
        private AnalyseLinqConnectionDataContext m_analyseDataContext = null;
    }
}
