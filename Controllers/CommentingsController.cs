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
    public class CommentingsController : Controller
    {
        private Entities db = new Entities();

        // POST: Commentings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Commenting commenting)
        {
            //Commenting commenting = new Commenting();
            if (Request != null)
            {
                commenting.TutorialId = Convert.ToInt32(Request["TutorialId"]);
                commenting.CommentOn = DateTime.Now;
                commenting.Comment = Request["Comment"];
                commenting.AspNetUserId = User.Identity.GetUserId();
                db.Commentings.Add(commenting);
                db.SaveChanges();
                return RedirectToAction("Details","Tutorials", new { id = commenting.TutorialId });
            }

            return RedirectToAction("Details", "Tutorials", new { id = commenting.TutorialId });
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
