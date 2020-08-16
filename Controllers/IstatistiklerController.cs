using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class IstatistiklerController : Controller
    {
        // GET: Istatistikler
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index()
        {
            var uye = db.Uyeler.Count().ToString();
            ViewBag.uyeSayisi = uye;
            var kitap = db.Kitaplar.Where(x => x.Durum2 == true).Count();
            ViewBag.kitapSayisi = kitap;
            var odunc = db.Kitaplar.Where(x => x.Durum == false).Count();
            ViewBag.oduncSayisi = odunc;
            var kasa = db.Cezalar.Sum(x => x.Ceza);
            ViewBag.kasaPara = kasa;
            return View();
        }

        public ActionResult Hava()
        {
            return View();
        }

        public ActionResult Galeri()
        {
            return View();
        }

        public ActionResult ResimYukle(HttpPostedFileBase fileBase)
        {
            if (fileBase.ContentLength > 0)
            {
                string dosyaYolu = Path.Combine(Server.MapPath("~/web2/resimler/"));
            }
            return View();
        }

        public ActionResult LinqKart()
        {
            var kitapSayisi = db.Kitaplar.Where(x => x.Durum2 == true).Count();
            var uyeSayisi = db.Uyeler.Where(x => x.Durum == true).Count();
            var kasaTutar = db.Cezalar.Sum(x => x.Ceza);
            var oduncKitap = db.Kitaplar.Where(x => x.Durum == false).Count();
            var kategoriSayisi = db.Kategoriler.Where(x => x.Durum == true).Count();
            var enAktifUye = (from e in db.Hareketler.GroupBy(x => x.Uye)
                              orderby e.Count() descending
                              select new
                              {
                                  e.Key
                              }).FirstOrDefault();
            var uyeismi = db.Uyeler.Find(enAktifUye.Key);
            var enCokOkunanKitap = (from x in db.Hareketler.GroupBy(x => x.Kitap)
                                    orderby x.Count() descending
                                    select new
                                    {
                                        x.Key
                                    }).FirstOrDefault();
            var kitapAd = db.Kitaplar.Find(enCokOkunanKitap.Key);
            var enFazlaKitapliYazar = (from x in db.Kitaplar.GroupBy(x => x.Yazar)
                                       orderby x.Count() descending
                                       select new
                                       {
                                           x.Key
                                       }).FirstOrDefault();
            var yazarAd = db.Yazarlar.Find(enFazlaKitapliYazar.Key);
            var enBasariliPersonel = (from x in db.Hareketler.GroupBy(x => x.Personel)
                                      orderby x.Count() descending
                                      select new
                                      {
                                          x.Key
                                      }).FirstOrDefault();
            var personelAd = db.Personeller.Find(enBasariliPersonel.Key);
            var mesajSayisi = db.Mesajlar.Count();
            var bugunkuEmanetler = db.Hareketler.Where(x => x.AlisTarihi == DateTime.Today).Count();
            var yazarSayisi = db.Yazarlar.Where(x => x.Durum == true).Count();

            ViewBag.kitapsayisi = kitapSayisi;
            ViewBag.uyesayisi = uyeSayisi;
            ViewBag.kasatutar = kasaTutar;
            ViewBag.odunckitap = oduncKitap;
            ViewBag.kategorisayisi = kategoriSayisi;
            ViewBag.enaktifuye = uyeismi.Ad + " " + uyeismi.Soyad;
            ViewBag.encokokunankitap = kitapAd.Ad;
            ViewBag.enfazlakitapliyazar = yazarAd.Ad + " " + yazarAd.Soyad;
            ViewBag.enbasarilipersonel = personelAd.Personel;
            ViewBag.mesajsayisi = mesajSayisi;
            ViewBag.bugunkuemanetler = bugunkuEmanetler;
            ViewBag.yazarsayisi = yazarSayisi;
            return View();
        }
    }
}