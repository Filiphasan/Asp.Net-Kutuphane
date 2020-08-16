using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.Classes;
using MVCKutuphane.Models.EntityF;
using MVCKutuphane.Models.Classes;

namespace MVCKutuphane.Controllers
{
    public class VitrinController : Controller
    {
        // GET: Vitrin
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        [HttpGet]
        public ActionResult Index()
        {
            Vitrin vitrin = new Vitrin();
            vitrin.kitaplars = db.Kitaplar.ToList();
            vitrin.hakkimizdas = db.Hakkimizda.ToList();
            return View(vitrin);
        }

        [HttpPost]
        public ActionResult Index(Mesajlar mesajlar)
        {
            db.Mesajlar.Add(mesajlar);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}