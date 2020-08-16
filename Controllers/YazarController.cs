using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class YazarController : Controller
    {
        // GET: Yazar
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index()
        {
            var yazarlar = db.Yazarlar.Where(x => x.Durum == true).ToList();
            return View(yazarlar);
        }
        [HttpGet]
        public ActionResult YazarEkle()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YazarEkle(Yazarlar yazarlar)
        {
            if (!ModelState.IsValid)
            {
                return View("YazarEkle");
            }
            yazarlar.Durum = true;
            db.Yazarlar.Add(yazarlar);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult YazarSil(int id)
        {
            var yazar = db.Yazarlar.Find(id);
            yazar.Durum = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult YazarGetir(int id)
        {
            var yazar = db.Yazarlar.Find(id);
            return View("YazarGetir", yazar);
        }

        public ActionResult YazarGuncelle(Yazarlar yazarlar)
        {
            var y = db.Yazarlar.Find(yazarlar.Id);
            y.Ad = yazarlar.Ad;
            y.Soyad = yazarlar.Soyad;
            y.Detay = yazarlar.Detay;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KitapListele(int id)
        {
            var kitaplar = db.Kitaplar.Where(x => x.Yazar == id && x.Durum2 == true).ToList();
            var yazar = db.Yazarlar.Find(id);
            var isim = yazar.Ad + " " + yazar.Soyad;
            //var ad = kitaplar.Select(x => x.Yazarlar.Ad).FirstOrDefault();
            //var soyad = kitaplar.Select(x => x.Yazarlar.Soyad).FirstOrDefault();
            ViewBag.yazarAd = isim;
            return View(kitaplar);
        }
    }
}