using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using MvcStok.Models.Entity;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace MvcStok.Controllers
{
    public class SatisController : Controller
    {
        // GET: Satis
        MvcDbStokEntities1 db = new MvcDbStokEntities1();
        public ActionResult Index()
        {
            var degerler = db.TblSatislar.ToList();
            ViewBag.dgr = degerler;
            List<SelectListItem> list = (from i in db.TblUrunler.ToList()
                                         select new SelectListItem
                                         {
                                             Value = i.UrunId.ToString(),
                                             Text = i.UrunAd
                                         }
                                        ).ToList();
            ViewBag.dgr2 = list;
            List<SelectListItem> list2 = (from i in db.TblMusteri.ToList()
                                          select new SelectListItem
                                          {
                                              Value = i.MusteriId.ToString(),
                                              Text = i.MusteriAd + " " + i.MusteriSoyad
                                          }).ToList();
            ViewBag.dgr3 = list2;
            return View();

        }
        [HttpGet]
        public ActionResult YeniSatis()
        {

            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult YeniSatis(TblSatislar p)
        {
            var urun = db.TblUrunler.Where(u => u.UrunId == p.TblUrunler.UrunId).FirstOrDefault();
            var mus = db.TblMusteri.Where(m => m.MusteriId == p.TblMusteri.MusteriId).FirstOrDefault();

            if (urun != null && mus != null)
            {
                p.UrunId = urun.UrunId;
                p.TblUrunler = urun;
                p.MusteriId = mus.MusteriId;
                p.TblMusteri = mus;
                urun.Stok = (byte)(urun.Stok - p.Adet);
                db.TblSatislar.Add(p);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        public ActionResult Sil(int id)
        {
            var satis = db.TblSatislar.Find(id);
            db.TblSatislar.Remove(satis);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil2(int id)
        {
            var satis = db.TblSatislar.Find(id);
            var urun = db.TblUrunler.Where(u => u.UrunId == satis.UrunId).FirstOrDefault();
            urun.Stok += (byte)satis.Adet;
            db.TblSatislar.Remove(satis);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult SatisGetir(int id)
        {
            var satis = db.TblSatislar.Find(id);

            var degerler = db.TblSatislar.ToList();
            ViewBag.dgr = degerler;
            List<SelectListItem> list = (from i in db.TblUrunler.ToList()
                                         select new SelectListItem
                                         {
                                             Value = i.UrunId.ToString(),
                                             Text = i.UrunAd
                                         }
                                        ).ToList();
            ViewBag.dgr2 = list;
            List<SelectListItem> list2 = (from i in db.TblMusteri.ToList()
                                          select new SelectListItem
                                          {
                                              Value = i.MusteriId.ToString(),
                                              Text = i.MusteriAd + " " + i.MusteriSoyad
                                          }).ToList();
            ViewBag.dgr3 = list2;
            //var urun = db.TblUrunler.Find(satis.UrunId);
            //ViewBag.dgr4 = urun.Stok;
            return View("SatisGetir", satis);
        }
        public ActionResult SatisGuncelle(TblSatislar s)
        {
            TblSatislar satis = db.TblSatislar.Find(s.SatisId);
            satis.Fiyat = s.Fiyat;
            satis.Adet = s.Adet;
            
            var urun = db.TblUrunler.Where(u => u.UrunId == s.TblUrunler.UrunId).FirstOrDefault();
            var mus = db.TblMusteri.Where(m => m.MusteriId == s.TblMusteri.MusteriId).FirstOrDefault();


            satis.MusteriId = mus.MusteriId;
            satis.UrunId = urun.UrunId;
            db.SaveChanges();
            return RedirectToAction("Index");



        }
    }
}