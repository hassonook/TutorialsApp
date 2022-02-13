using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TutorialsApp.Models;

namespace TutorialsApp.Controllers
{
    public class RatingsController : Controller
    {
        private Entities db = new Entities();

        // POST: Ratings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Rating rating)
        {
            if (Request != null)
            {
                rating.TutorialId = Convert.ToInt32(Request["TutorialId"]);
                rating.RatedOn = DateTime.Now;
                rating.Rate = Convert.ToInt32(Request["Rate"]);
                rating.AspNetUserId = User.Identity.GetUserId();
                Rating userRate = db.Ratings.Where(x => x.TutorialId == rating.TutorialId && x.AspNetUserId == rating.AspNetUserId).FirstOrDefault();
                if (userRate == null)
                {
                    db.Ratings.Add(rating);
                    db.SaveChanges();
                }
                else
                {
                    userRate.Rate = rating.Rate; 
                    userRate.RatedOn = DateTime.Now;
                    db.Entry(userRate).State = EntityState.Modified;
                    db.SaveChanges();
                }
                return RedirectToAction("Details", "Tutorials", new { id = rating.TutorialId });
            }

            return RedirectToAction("Details", "Tutorials", new { id = rating.TutorialId });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
