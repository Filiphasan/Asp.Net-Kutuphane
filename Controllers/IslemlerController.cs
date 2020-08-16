using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class IslemlerController : Controller
    {
        // GET: Islemler
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index()
        {
            var islemler = db.Hareketler.Where(x => x.IslemDurum == true).ToList();
            return View(islemler);
        }
    }
}