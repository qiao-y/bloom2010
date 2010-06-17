// Author: Yang Juyuan
// Date: 2010.6.7
// Just for test, we need to run this part to read the snapshot and store it into the database, before viewing the preview page of a book
// just need to run it once.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using BLOOM.Web.Models.Book;

namespace BLOOM.Web.Controllers
{
    public class SnapshotTestController : Controller
    {
        //
        // GET: /SnapshotTest/

        public ActionResult Snapshot(int id)
        {
            byte[] myByte = m_bookRepository.GetBookInfo(id).Snapshot.ToArray();
            return File(myByte, @"image/jpeg");
        }

        public ActionResult Index()
        {
            StoreSnapshot storeSnapshot = new StoreSnapshot();
            storeSnapshot.StoreEachSnapshot();
            return View();
        }
        private BookRepository m_bookRepository = new BookRepository();
    }
}
