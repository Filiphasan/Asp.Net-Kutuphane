using MVCKutuphane.Models.EntityF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;
using System.Web.Security;

namespace MVCKutuphane.Controllers
{
    public class PanelimController : Controller
    {
        // GET: Panelim
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        [Authorize]
        public ActionResult Index()
        {
            var uyeMail = (string)Session["Mail"];
            var deger = db.Uyeler.First(x => x.Mail == uyeMail);
            return View(deger);
        }

        [HttpPost]
        public ActionResult Index2(Uyeler uyeler)
        {
            var u = (string)Session["Mail"];
            var uye = db.Uyeler.FirstOrDefault(x => x.Mail ==u);
            uye.Sifre = uyeler.Sifre;
            uye.Ad = uyeler.Ad;
            uye.Soyad = uyeler.Soyad;
            uye.Okul = uyeler.Okul;
            uye.KullaniciAdi = uyeler.KullaniciAdi;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Kitaplarim()
        {
            var uyeMail = (string)Session["Mail"];
            var uye = db.Uyeler.FirstOrDefault(x => x.Mail == uyeMail);
            var hareketler = db.Hareketler.Where(x => x.Uye == uye.Id).OrderByDescending(x => x.AlisTarihi).ToList();
            return View(hareketler);
        }

        public ActionResult DuyuruListesi()
        {
            var duyurular = db.Duyurular.Where(x => x.Durum == true).OrderByDescending(x => x.Id).ToList();
            return View(duyurular);
        }

        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            return RedirectToAction("GirisYap", "Login");
        }
    }
}