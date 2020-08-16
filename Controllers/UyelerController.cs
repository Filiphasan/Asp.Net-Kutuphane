using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;
using PagedList;
using PagedList.Mvc;

namespace MVCKutuphane.Controllers
{
    public class UyelerController : Controller
    {
        // GET: Uyeler
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index(string p,int sayi = 1 )
        {
            var uyeler = db.Uyeler.Where(x => x.Durum == true).ToList().ToPagedList(sayi, 10);
            if (!string.IsNullOrEmpty(p))
            {
                uyeler = uyeler.Where(x => x.Ad.Contains(p)).ToList().ToPagedList(sayi, 10);
            }
            return View(uyeler);
        }

        [HttpGet]
        public ActionResult YeniUye()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniUye(Uyeler uyeler)
        {
            uyeler.Durum = true;
            db.Uyeler.Add(uyeler);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UyeSil(int id)
        {
            var uye = db.Uyeler.Find(id);
            uye.Durum = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UyeGetir(int id)
        {
            var uye = db.Uyeler.Find(id);
            return View("UyeGetir", uye);
        }

        public ActionResult UyeGuncelle(Uyeler uyeler)
        {
            var u = db.Uyeler.Find(uyeler.Id);
            u.Ad = uyeler.Ad;
            u.Soyad = uyeler.Soyad;
            u.Mail = uyeler.Mail;
            u.KullaniciAdi = uyeler.KullaniciAdi;
            u.Sifre = uyeler.Sifre;
            u.Fotograf = uyeler.Fotograf;
            u.Telefon = uyeler.Telefon;
            u.Okul = uyeler.Okul;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KitapListesi(int id)
        {
            var kitaplar = db.Hareketler.Where(x => x.Uye == id).ToList();
            var uye = db.Uyeler.Find(id);
            var isim = uye.Ad + " " + uye.Soyad;
            ViewBag.uyeAd = isim;
            return View(kitaplar);
        }
    }
}