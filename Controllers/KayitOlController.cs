using MVCKutuphane.Models.EntityF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class KayitOlController : Controller
    {
        // GET: KayitOl
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        [HttpGet]
        public ActionResult Kayit()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Kayit(Uyeler uyeler)
        {
            if (!ModelState.IsValid)
            {
                return View("Kayit");
            }
            db.Uyeler.Add(uyeler);
            db.SaveChanges();
            return View();
        }
    }
}