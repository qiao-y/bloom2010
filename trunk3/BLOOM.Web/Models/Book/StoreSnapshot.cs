//Author: YJY
//Date: 2010.5.19
//Provide a class to read and store the snapshot of all the books,
// and the picture is stored in the server desktop at first

// need to catch the exception, i will do it later
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Drawing.Imaging;
using System.Collections;


namespace BLOOM.Web.Models.Book
{
    public class StoreSnapshot
    {
        public StoreSnapshot()
        {
            m_bookDataContext = new BookLinqConnecionDataContext();  //instantiate a user context class
        }

        public IQueryable<book_BookInfo> FindAllBooks()
        {
            return m_bookDataContext.book_BookInfo;
        }

        public book_BookInfo FindBook(int id)
        {
            return m_bookDataContext.book_BookInfo.SingleOrDefault(d => d.BookId == id);
        }

        private void Save()
        {
            m_bookDataContext.SubmitChanges();
        }

        public void StoreEachSnapshot()
        {
            var allBooks = FindAllBooks();
            foreach (book_BookInfo book in allBooks)    // can be changed. store the snapshots of all the books, here~
            {
                String picturePath = "D:\\" + book.BookId.ToString() + ".jpg";   // the location of picture, can be changed
                FileStream fileStream = new FileStream(picturePath, FileMode.Open, FileAccess.Read);
                byte[] myByte = new byte[fileStream.Length];
                fileStream.Read(myByte, 0, (int)fileStream.Length);
                book.Snapshot = myByte;
            }

            Save();
        }

        // private:
        private BookLinqConnecionDataContext m_bookDataContext = null;
    }
}