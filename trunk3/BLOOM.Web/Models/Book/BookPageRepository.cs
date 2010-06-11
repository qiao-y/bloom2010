//Date: 2010.5.14
//Author: Yang Juyuan

//Revised by: QIAO Yu
//Date: 2010.5.19
//Note: It is assumed that the file name is of 001.jpg, 002.jpg.....  style
//         It will *break down* when a book has more than 1000 pages.

using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;


namespace BLOOM.Web.Models.Book
{
    public class BookPageRepository
    {
        //public:

        public BookPageRepository()
        {
        }


        public BookPageRepository(string contentDir, int totalPages)
        {
            m_folderName = contentDir;
            m_totalPages = totalPages;
        }

        public void SetFolderName(string folderName)
        {
            m_folderName = folderName;
        }

        public string GetPagePath(int page)
        {
            if (page < 1)
                page = 1;
            if (page > m_totalPages)
                page = m_totalPages;
            m_currentPage = page;
            string fileName = m_folderName + '\\';
            if (0 <= page && page <= 9)
                fileName += "00" + page.ToString();
            else if (10 <= page && page <= 99)
                fileName += "0" + page.ToString();
            else
                fileName += page.ToString();
            fileName += ".jpg";
            return fileName;
        }


        public Image GetPage(int page)
        {
            if (page < 1)
                page = 1;
            if (page > m_totalPages)
                page = m_totalPages;
            m_currentPage = page;
            string fileName = m_folderName + '\\';
            if (0 <= page && page <= 9)
                fileName += "00" + page.ToString();
            else if (10 <= page && page <= 99)
                fileName += "0" + page.ToString();
            else 
                fileName += page.ToString();
            fileName += ".jpg";
            return Image.FromFile(fileName);
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
        private string m_folderName;
        private int m_totalPages;
        private int m_currentPage;

    }
}
