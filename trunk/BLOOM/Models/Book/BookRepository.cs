//Author: QIAO Yu
//Date: 2010.5.14
//The repository class of book

using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Data.Linq;

using BLOOM.Models.Book;

namespace BLOOM.Models.Book
{
    public class BookRepository
    {
       //  public :
        public BookRepository()
        {
           m_bookDataContext = new BookLinqConnecionDataContext();  //instantiate a user context class
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
        private BookLinqConnecionDataContext m_bookDataContext = null;

    }
}
