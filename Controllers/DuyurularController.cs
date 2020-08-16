using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class DuyurularController : Controller
    {
        // GET: Duyurular
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index()
        {
            var duyurular = db.Duyurular.Where(x => x.Durum == true).ToList();
            return View(duyurular);
        }

        [HttpGet]
        public ActionResult YeniDuyuru()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniDuyuru(Duyurular duyurular)
        {
            duyurular.Durum = true;
            db.Duyurular.Add(duyurular);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DuyuruSil(int id)
        {
            var duyuru = db.Duyurular.Find(id);
            duyuru.Durum = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DuyuruGetir(int id)
        {
            var duyuru = db.Duyurular.Find(id);
            return View("DuyuruGetir", duyuru);
        }

        public ActionResult DuyuruGuncelle(Duyurular duyurular)
        {
            var d = db.Duyurular.Find(duyurular.Id);
            d.Kategori = duyurular.Kategori;
            d.Duyuru = duyurular.Duyuru;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}