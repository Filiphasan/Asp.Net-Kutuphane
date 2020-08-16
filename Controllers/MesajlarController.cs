using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class MesajlarController : Controller
    {
        // GET: Mesajlar
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index()
        {
            var uyeMail = (string)Session["Mail"];
            var degerler = db.KullaniciMesajlar.Where(x => x.Alici == uyeMail).ToList();
            return View(degerler);
        }
        [HttpGet]
        public ActionResult YeniMesaj()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniMesaj(KullaniciMesajlar mesajlar)
        {
            mesajlar.Durum = true;
            db.KullaniciMesajlar.Add(mesajlar);
            db.SaveChanges();
            return View("YeniMesaj");
        }

        public ActionResult GidenMesaj()
        {
            var uyeMail = (string)Session["Mail"];
            var mesajlar = db.KullaniciMesajlar.Where(x => x.Gonderen == uyeMail).ToList();
            return View(mesajlar);
        }
    }
}