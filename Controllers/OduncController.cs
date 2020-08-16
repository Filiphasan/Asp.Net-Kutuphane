using MVCKutuphane.Models.EntityF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class OduncController : Controller
    {
        // GET: Udunc
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index()
        {
            var hareketler = db.Hareketler.Where(x => x.IslemDurum == false).ToList();
            return View(hareketler);
        }

        [HttpGet]
        public ActionResult OduncVer()
        {
            List<SelectListItem> kitaplar = (from k in db.Kitaplar.Where(x => x.Durum == true).ToList()
                                             select new SelectListItem
                                             {
                                                 Text = k.Ad,
                                                 Value = k.Id.ToString()
                                             }).ToList();
            ViewBag.kitapListe = kitaplar;
            List<SelectListItem> uyeler = (from u in db.Uyeler.Where(x => x.Durum == true).ToList()
                                           select new SelectListItem
                                           {
                                               Text = u.Ad + " " + u.Soyad,
                                               Value = u.Id.ToString()
                                           }).ToList();
            ViewBag.uyeListe = uyeler;

            List<SelectListItem> personeller = (from p in db.Personeller.Where(x => x.Durum == true).ToList()
                                                select new SelectListItem
                                                {
                                                    Text = p.Personel,
                                                    Value = p.Id.ToString()
                                                }).ToList();
            ViewBag.personelListe = personeller;
            return View();
        }

        [HttpPost]
        public ActionResult OduncVer(Hareketler hareketler)
        {
            var ktp = db.Kitaplar.Where(x => x.Id == hareketler.Kitaplar.Id).FirstOrDefault();
            if (ktp.Durum == true)
            {
                var uye = db.Uyeler.Where(x => x.Id == hareketler.Uyeler.Id).FirstOrDefault();
                var personel = db.Personeller.Where(x => x.Id == hareketler.Personeller.Id).FirstOrDefault();
                hareketler.Kitaplar = ktp;
                hareketler.Uyeler = uye;
                hareketler.Personeller = personel;
                hareketler.IslemDurum = false;
                ktp.Durum = false;
                db.Hareketler.Add(hareketler);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }

        public ActionResult OduncAl(Hareketler p)
        {
            var islem = db.Hareketler.Find(p.Id);
            DateTime d1 = Convert.ToDateTime(islem.İadeTarih);
            DateTime d2 = DateTime.Today;
            TimeSpan d3 = d2 - d1;
            ViewBag.cezaGun = d3.TotalDays;
            return View("OduncAl", islem);
        }

        public ActionResult OduncİadeAl(Hareketler hareketler)
        {
            var h = db.Hareketler.Find(hareketler.Id);
            var ktp = db.Kitaplar.Find(h.Kitap);
            ktp.Durum = true;
            h.IslemDurum = true;
            h.GeldigiTarih = hareketler.GeldigiTarih;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}