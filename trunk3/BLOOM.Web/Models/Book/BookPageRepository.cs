//Date: 2010.5.14
//Author: Yang Juyuan

//Revised by: QIAO Yu
//Date: 2010.5.19
//Note: It is assumed that the file name is of XXXX_p0001.jpg, XXXX_p0002.jpg.....  style
//         It will *break down* when a book has more than 9999 pages.

//Revised by: QIAO Yu
//Date: 2010.6.14
//Stable version

using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.IO;

namespace BLOOM.Web.Models.Book
{
    public class BookPageRepository
    {
        //public:

        private BookPageRepository()
        {
            //freeze it
        }


        public BookPageRepository(string firstPage, int totalPages)
        {
            m_firstPagePath = firstPage;
            m_totalPages = totalPages;
        }

        public void SetFirstPagePath(string firstPage)
        {
            m_firstPagePath = firstPage;
        }

        public byte[] GetPage(int page)
        {
            if (page < 1)
                page = 1;
            if (page > m_totalPages)
                page = m_totalPages;
            m_currentPage = page;
            string fileName = m_firstPagePath.Substring(0,m_firstPagePath.Length - 8);
         
            //minus the length of "_p0001.jpg" 

            if (0 <= page && page <= 9)
                fileName += "000" + page.ToString();
            else if (10 <= page && page <= 99)
                fileName += "00" + page.ToString();
            else if (100 <= page && page <= 999)
                fileName += "0" + page.ToString();
            else
                fileName += page.ToString();
            fileName += ".jpg";
            Image thisPage = Image.FromFile(fileName);
            MemoryStream ms = new MemoryStream();
            thisPage.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            return ms.ToArray();
        }

        public void SetCurrentPage(int page)
        {
            m_currentPage = page;
        }

        public int GetCurrentPage()
        {
            return m_currentPage;
        }

        public int GetPreviousPage()
        {
            if (m_currentPage > 1)
                return m_currentPage - 1;
            else
                return 1;
        }

        public int GetNextPage()
        {
            if (m_currentPage < m_totalPages)
                return m_currentPage + 1;
            else
                return m_totalPages;
        }

        //private:

        private string m_firstPagePath;
        private int m_totalPages;
        private int m_currentPage;

    }
}
