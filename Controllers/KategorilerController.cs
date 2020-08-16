using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class KategorilerController : Controller
    {
        // GET: Kategoriler
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index()
        {
            var kategoriler = db.Kategoriler.Where(x => x.Durum == true).ToList();
            return View(kategoriler);
        }

        [HttpGet]
        public ActionResult YeniKategori()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniKategori(Kategoriler kategoriler)
        {
            db.Kategoriler.Add(kategoriler);
            kategoriler.Durum = true;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KategoriSil(int id)
        {
            var kategori = db.Kategoriler.Find(id);
            kategori.Durum = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult KategoriGetir(int id)
        {
            var kategori = db.Kategoriler.Find(id);
            return View("KategoriGetir", kategori);
        }

        public ActionResult KategoriGuncelle(Kategoriler kategoriler)
        {
            var k = db.Kategoriler.Find(kategoriler.Id);
            k.Kategori = kategoriler.Kategori;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}