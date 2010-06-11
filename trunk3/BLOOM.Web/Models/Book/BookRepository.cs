//Author: QIAO Yu
//Date: 2010.5.14
//The repository class of book

using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Data.Linq;

using BLOOM.Web.Models.Book;

namespace BLOOM.Web.Models.Book
{
    public class BookRepository
    {
       //  public :
        public BookRepository()
        {
           m_bookDataContext = new BookLinqConnectionDataContext();  //instantiate a user context class
        }

        public int[] GetBookID(string keyWord, int kind)
        {
            //kind = 0 : title 
            //kind = 1 : ISBN
            //kind = 2 : excerpt
            //kind = 3 : author
            //kind = 4 : publishing house
            //kind = 5 : publishing date

            //ArrayList result = new ArrayList();
            int[] result = null;

            switch (kind)
            {
                case 0:
                    var item1 = from d in m_bookDataContext.book_BookInfo
                                where d.Title.Contains(keyWord)
                                select d.BookId;
                    result = item1.ToArray();
                    break;

                case 1:
                    try
                    {
                        var item2 = m_bookDataContext.book_BookInfo.SingleOrDefault(d => d.ISBN == keyWord).BookId;
                        result = new int[1];
                        result[0] = item2;
                    }
                    catch (Exception)
                    {
                        result = new int[0];
                        break;
                    }

                    break;

                case 2:
                    var item3 = from d in m_bookDataContext.book_BookInfo
                                where d.Extract.Contains(keyWord)
                                select d.BookId;
                    result = item3.ToArray();
                    break;

                case 3:
                    var item4 = from d in m_bookDataContext.book_BookInfo
                                where d.Author.Contains(keyWord)
                                select d.BookId;
                    result = item4.ToArray();
                    break;

                case 4:
                    var item5 = from d in m_bookDataContext.book_BookInfo
                                where d.Publisher.Contains(keyWord)
                                select d.BookId;
                    result = item5.ToArray();
                    break;

                //special case
                //case 5:
                //    DateTime theDate = new DateTime(
                //    var item6 = from d in m_bookDataContext.book_BookInfo
                //                where d.PublicationDate.Value== (DateTime)keyWord;
                //                select d.BookId;
                //    result = item6.ToArray();
                //    break;
                default:
                    break;
            }

            return result;
        }



        public string GetBookPath(int id)
        {
            return m_bookDataContext.book_BookInfo.SingleOrDefault(d => d.BookId == id).Path; 
        }

        public book_BookInfo GetBookInfo(int id)
        {
            return m_bookDataContext.book_BookInfo.SingleOrDefault(d => d.BookId == id);
        }

        public void AddBookBoughtInfo(book_BookBought theInfo)
        {
            m_bookDataContext.book_BookBought.InsertOnSubmit(theInfo);
        }

        public bool IsBought(Guid uid, int bookID)
        {
            var result = from d in m_bookDataContext.book_BookBought
                         where d.BookId == bookID && d.UserId == uid
                         select d;
            return result.Count() >= 1;
            //foreach (book_BookBought item in result.ToArray())
            //    if (item.UserId == uid)
            //        return true;
            //return false;
        }


        public void Submit()
        {
            m_bookDataContext.SubmitChanges();
        }

        // private:          
        private BookLinqConnectionDataContext m_bookDataContext = null;

    }
}
