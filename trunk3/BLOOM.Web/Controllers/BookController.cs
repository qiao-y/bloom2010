//Author: QIAO Yu
//Date: 2010.5.14
//Description: This file defines the book controller class. 

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Drawing;
using System.IO;

using BLOOM.Web.Models.Book;
using BLOOM.Web.Models.User;

namespace BLOOM.Web.Controllers
{
    public class BookController : Controller
    {
        //pubic:

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Search(string keyWord, int kind)
        {
            //kind = 0 : title 
            //kind = 1 : ISBN
            //kind = 2 : excerpt
            //kind = 3 : author
            //kind = 4 : publishing house
            //kind = 5 : publishing date
            ArrayList result = new ArrayList();
            int[] bookID = m_bookRepository.GetBookID(keyWord, kind);
            foreach (var id in bookID)
                result.Add(m_bookRepository.GetBookInfo((int)id));
            return View("BookSearchResult", result);
        }


        public ActionResult Preview(int id)
        {
            book_BookInfo theInfo = m_bookRepository.GetBookInfo(id);
            return View(theInfo);
        }

        // YJY
        public ActionResult Snapshot(int id)
        {
            byte[] myByte = m_bookRepository.GetBookInfo(id).Snapshot.ToArray();
            return File(myByte, @"image/jpeg");
        }

        [Authorize]
        public ActionResult Buy(int bookID)
        {
            MembershipUser user = Membership.GetUser(User.Identity.Name);  //get current user identification
            Guid userGuid = (Guid)user.ProviderUserKey;
            aspnet_AccountInfo accountInfo = m_userRepository.GetAccountInfo(userGuid);
            book_BookInfo bookInfo = m_bookRepository.GetBookInfo(bookID);
            if (accountInfo.Balance < bookInfo.Price)   //not enough money
                return RedirectToAction("Preview", bookID);

            //determine if the user had bought it before!

            accountInfo.Balance -= (int)bookInfo.Price; // deduct from the account

            //insert a record 
            book_BookBought bookBought = new book_BookBought();
            bookBought.BookId = bookID;
            bookBought.UserId = userGuid;
            bookBought.MoneyPaid = (int)bookInfo.Price;
            bookBought.PurchaseDate = DateTime.Today;
            m_bookRepository.AddBookBoughtInfo(bookBought);

            try
            {
                m_userRepository.Submit();
                m_bookRepository.Submit();
                return RedirectToAction("Read", new { id = bookID, page = 1 });  //great
            }

            catch
            {
                return RedirectToAction("Preview", bookID);//Oops.... Something happened...
                //return RedirectToAction("BuyFailed");  
            }

        }

        [Authorize]
        public ActionResult BuyFailed()
        {
            return View();    //failed to buy a book
        }

        [Authorize]
        public ActionResult Read(int id, int page)
        {
            MembershipUser user = Membership.GetUser(User.Identity.Name);  //get current user identification
            Guid userGuid = (Guid)user.ProviderUserKey;
            if (!m_bookRepository.IsBought(userGuid, id))   //not bought yet
                return RedirectToAction("Buy", new { bookID = id });
            string path = m_bookRepository.GetBookPath(id);
            int totalPages = m_bookRepository.GetBookInfo(id).Pages ?? 999;
            BookPageRepository bookPageRepository = new BookPageRepository(path, totalPages);
            Image thisPage = bookPageRepository.GetPage(page);
            MemoryStream ms = new MemoryStream();
            thisPage.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            ViewData["id"] = id;  //temp
            ViewData["page"] = page;   //temp
            Response.BinaryWrite(ms.ToArray());
            return View("Read", "project");
        }


        //private:
        private BookRepository m_bookRepository = new BookRepository();
        private UserRepository m_userRepository = new UserRepository();

    }
}
