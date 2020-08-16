using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCKutuphane.Models.EntityF;
using System.Web.Security;

namespace MVCKutuphane.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        MVCKutuphaneEntities db = new MVCKutuphaneEntities();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult GirisYap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GirisYap(Uyeler uyeler)
        {
            var bilgiler = db.Uyeler.FirstOrDefault(x => x.Mail == uyeler.Mail && x.Sifre == uyeler.Sifre);
            if (bilgiler != null)
            {
                FormsAuthentication.SetAuthCookie(bilgiler.Mail,false);
                Session["Mail"] = bilgiler.Mail;
                //TempData["Id"] = bilgiler.Id;
                //TempData["Ad"] = bilgiler.Ad;
                //TempData["Soyad"] = bilgiler.Soyad;
                //TempData["KullaniciAdi"] = bilgiler.KullaniciAdi;
                //TempData["Sifre"] = bilgiler.Sifre;
                //TempData["Okul"] = bilgiler.Okul;
                return RedirectToAction("Index","Panelim");
            }
            else
            {
                return View();
            }
        }
    }
}