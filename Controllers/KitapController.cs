using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class KitapController : Controller
    {
        // GET: Kitap
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index(string p)
        {
            var kitaplar = db.Kitaplar.Where(x => x.Durum2 == true).ToList();
            if (!string.IsNullOrEmpty(p))
            {
                kitaplar = kitaplar.Where(x => x.Ad.Contains(p)).ToList();
            }
            return View(kitaplar);
        }

        [HttpGet]
        public ActionResult YeniKitap()
        {
            List<SelectListItem> yazarlar = (from y in db.Yazarlar.Where(x => x.Durum == true).ToList()
                                             select new SelectListItem
                                             {
                                                 Text = y.Ad + " " + y.Soyad,
                                                 Value = y.Id.ToString()
                                             }).ToList();
            List<SelectListItem> kategoriler = (from k in db.Kategoriler.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = k.Kategori,
                                                    Value = k.Id.ToString()
                                                }).ToList();
            ViewBag.dropYazar = yazarlar;
            ViewBag.dropKategori = kategoriler;
            return View();
        }

        [HttpPost]
        public ActionResult YeniKitap(Kitaplar kitaplar)
        {
            kitaplar.Durum = true;
            kitaplar.Durum2 = true;
            var ktg = db.Kategoriler.Where(x => x.Id == kitaplar.Kategoriler.Id).FirstOrDefault();
            var yzr = db.Yazarlar.Where(x => x.Id == kitaplar.Yazarlar.Id).FirstOrDefault();
            kitaplar.Kategoriler = ktg;
            kitaplar.Yazarlar = yzr;
            db.Kitaplar.Add(kitaplar);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KitapSil(int id)
        {
            var ktp = db.Kitaplar.Find(id);
            ktp.Durum2 = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KitapGetir(int id)
        {
            List<SelectListItem> yazarlar = (from y in db.Yazarlar.Where(x => x.Durum == true).ToList()
                                             select new SelectListItem
                                             {
                                                 Text = y.Ad + " " + y.Soyad,
                                                 Value = y.Id.ToString()
                                             }).ToList();
            List<SelectListItem> kategoriler = (from k in db.Kategoriler.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = k.Kategori,
                                                    Value = k.Id.ToString()
                                                }).ToList();
            ViewBag.dropYazar = yazarlar;
            ViewBag.dropKategori = kategoriler;
            var kitap = db.Kitaplar.Find(id);
            return View("KitapGetir", kitap);
        }

        public ActionResult KitapGuncelle(Kitaplar kitaplar)
        {
            var k = db.Kitaplar.Find(kitaplar.Id);
            var ktg = db.Kategoriler.Where(x => x.Id == kitaplar.Kategoriler.Id).FirstOrDefault();
            var yzr = db.Yazarlar.Where(x => x.Id == kitaplar.Yazarlar.Id).FirstOrDefault();
            k.Ad = kitaplar.Ad;
            k.Kategori = ktg.Id;
            k.Yazar = yzr.Id;
            k.BasimYili = kitaplar.BasimYili;
            k.Sayfa = kitaplar.Sayfa;
            k.YayinEvi = kitaplar.YayinEvi;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}