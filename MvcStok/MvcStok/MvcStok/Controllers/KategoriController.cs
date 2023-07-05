using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStok.Models.Entity;
using PagedList;
using PagedList.Mvc;


namespace MvcStok.Controllers
{
    public class KategoriController : Controller
    {
        MvcDbStokEntities1 db = new MvcDbStokEntities1();
        // GET: Kategori
        public ActionResult Index(int sayfa=1)
        {
            //var degerler = db.TblKategoriler.ToList();
            var degerler = db.TblKategoriler.ToList().ToPagedList(sayfa, 4);
            return View(degerler);
        }

        [HttpGet]//sayfada herhangi bir işlem yapılmazsa sadece sayfayı göserir
        public ActionResult YeniKategori()
        {
            return View();
        }
        [HttpPost]//sayfada herhangi bir işlem yapılırsa bu komutu döndürür
        public ActionResult YeniKategori(TblKategoriler k1)
        {
            if (!ModelState.IsValid)
            {
                return View("Yenikategori");
            }
            db.TblKategoriler.Add(k1);
            db.SaveChanges();
            return View();
        }

        public ActionResult Sil(int id)
        {
            var kategori = db.TblKategoriler.Find(id);
            db.TblKategoriler.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        public ActionResult KategoriGetir(int id)
        {
            var ktgr = db.TblKategoriler.Find(id);
            return View("KategoriGetir", ktgr);

        }

        public ActionResult Guncelle(TblKategoriler k)
        {
            var ktg = db.TblKategoriler.Find(k.KategoriId);
            ktg.KategoriAd = k.KategoriAd;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}