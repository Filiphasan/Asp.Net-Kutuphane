using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Controllers
{
    public class PersonellerController : Controller
    {
        // GET: Personeller
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index()
        {
            var personeller = db.Personeller.Where(x => x.Durum == true).ToList();
            return View(personeller);
        }

        [HttpGet]
        public ActionResult YeniPersonel()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniPersonel(Personeller personeller)
        {
            try
            {
                personeller.Durum = true;
                db.Personeller.Add(personeller);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return View();
            }
        }

        public ActionResult PersonelSil(int id)
        {
            var personel = db.Personeller.Find(id);
            personel.Durum = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult PersonelGetir(int id)
        {
            var personel = db.Personeller.Find(id);
            return View("PersonelGetir", personel);
        }

        public ActionResult PersonelGuncelle(Personeller personeller)
        {
            var p = db.Personeller.Find(personeller.Id);
            p.Personel = personeller.Personel;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}