using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStok.Models.Entity;

namespace MvcStok.Controllers
{
    public class MusteriController : Controller
    {
        // GET: Musteri
        MvcDbStokEntities1 db = new MvcDbStokEntities1();
        public ActionResult Index(string p)
        {
            var degerler = from d in db.TblMusteri select d;
            if (!string.IsNullOrEmpty(p))
            {
                //İşlem
                degerler = degerler.Where(m => m.MusteriAd.Contains(p));
            }
            return View(degerler.ToList());
            //var degerler = db.TblMusteri.ToList();
            //return View(degerler);
        }
        [HttpGet]
        public ActionResult YeniMusteri()
        {
            return View();

        }
        [HttpPost]
        public ActionResult YeniMusteri(TblMusteri musteri)
        {
            if (!ModelState.IsValid)
            {
                return View("YeniMusteri");
            }
            db.TblMusteri.Add(musteri);
            db.SaveChanges();
            return View();
        }

        public ActionResult Sil(int id)
        {
            var musteri = db.TblMusteri.Find(id);
            db.TblMusteri.Remove(musteri);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult MusteriGetir(int id)
        {
            var musteri = db.TblMusteri.Find(id);
            return View("MusteriGetir", musteri);
        }
        public ActionResult Guncelle(TblMusteri musteri)
        {
            var mus = db.TblMusteri.Find(musteri.MusteriId);
            mus.MusteriAd = musteri.MusteriAd;
            mus.MusteriSoyad = musteri.MusteriSoyad;
            db.SaveChanges();
            return RedirectToAction("Index");

        }

    }
}