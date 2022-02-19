using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TutorialsApp.Models;

namespace TutorialsApp.Controllers
{
    public class TutorialsController : Controller
    {
        private Entities db = new Entities();

        // GET: Tutorials
        public ActionResult Index(string cat)
        {
            var tutorials = db.Tutorials.Include(t => t.Category).Include(t => t.TutorialType).Include(t => t.AspNetUser).Where(x=>x.Active);
            if (User.IsInRole("Admin"))
            {
                tutorials = db.Tutorials.Include(t => t.Category).Include(t => t.TutorialType).Include(t => t.AspNetUser);
            }
            if (cat != null)
            {
                tutorials = db.Tutorials.Where(x => x.Category.Name == cat);
            }
            return View(tutorials.ToList());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        // GET: Tutorials/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tutorial tutorial = db.Tutorials.Find(id);
            if (tutorial == null)
            {
                return HttpNotFound();
            }
            return View(tutorial);
        }

        // Download File
        public FileResult DownloadFile(int? id)
        {
            string filePath = db.Tutorials.Find(id).PathFile;
            var sFile = Server.MapPath(Path.Combine(filePath));
            byte[] fileBytes = System.IO.File.ReadAllBytes(sFile);
            string contentType = MimeMapping.GetMimeMapping(sFile);
            var cd = new System.Net.Mime.ContentDisposition
            {
                FileName = Path.GetFileName(sFile),
                Inline = true,
            };
            Response.AppendHeader("Content-Disposition", cd.ToString());
            return File(fileBytes, contentType);
        }


        // GET: Tutorials/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name");
            ViewBag.TutorialTypeId = new SelectList(db.TutorialTypes, "Id", "Name");
            return View();
        }

        // POST: Tutorials/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,PathFile,CategoryId,TutorialTypeId,Desc")] Tutorial tutorial, HttpPostedFileBase PathFile)
        {
            if (ModelState.IsValid)
            {
                if (PathFile != null && PathFile.ContentLength > 0)
                {
                    string category = db.Categories.Find(tutorial.CategoryId).Name;
                    ///upload file///////////////////////////////////////////////
                    tutorial.FileSize = PathFile.ContentLength;
                    string dirPath = Server.MapPath("~/Libarary/"+ category + "/");
                    string extension = Path.GetExtension(PathFile.FileName);
                    string fileName = tutorial.Name.Replace(" ", "")+extension;
                    if (!Directory.Exists(dirPath))
                        Directory.CreateDirectory(dirPath);
                    string _path = Path.Combine(dirPath, fileName);
                    PathFile.SaveAs(_path);
                    string filePath = "~/Libarary/" + category + "/" + fileName;
                    tutorial.PathFile = filePath;
                    ///end upload file/////////////////////////////////////////////
                    tutorial.CreatedBy = User.Identity.GetUserId();
                    tutorial.CreatedOn = DateTime.Now;
                }
                db.Tutorials.Add(tutorial);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name", tutorial.CategoryId);
            ViewBag.TutorialTypeId = new SelectList(db.TutorialTypes, "Id", "Name", tutorial.TutorialTypeId);
            ViewBag.CreatedBy = new SelectList(db.AspNetUsers, "Id", "FullName", tutorial.CreatedBy);
            return View(tutorial);
        }

        // GET: Tutorials/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tutorial tutorial = db.Tutorials.Find(id);
            if (tutorial == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name", tutorial.CategoryId);
            ViewBag.TutorialTypeId = new SelectList(db.TutorialTypes, "Id", "Name", tutorial.TutorialTypeId);
            return View(tutorial);
        }

        // POST: Tutorials/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Tutorial editedTutorial, HttpPostedFileBase pathFile)
        {
            Tutorial tutorial = db.Tutorials.Find(editedTutorial.Id);
            ModelState["pathFile"].Errors.Clear();
            
            if (ModelState.IsValid)
            {
                if (pathFile != null && pathFile.ContentLength > 0)
                {
                    string category = db.Categories.Find(tutorial.CategoryId).Name;
                    ///upload file///////////////////////////////////////////////
                    tutorial.FileSize = pathFile.ContentLength;
                    string dirPath = Server.MapPath("~/Libarary/" + category + "/");
                    string extension = Path.GetExtension(pathFile.FileName);
                    string fileName = tutorial.Name.Replace(" ", "") + extension;
                    if (!Directory.Exists(dirPath))
                        Directory.CreateDirectory(dirPath);
                    string _path = Path.Combine(dirPath, fileName);
                    pathFile.SaveAs(_path);
                    string filePath = "~/Libarary/" + category + "/" + fileName;
                    editedTutorial.PathFile = filePath;
                    ///end upload file/////////////////////////////////////////////
                }
                tutorial.Name = editedTutorial.Name;
                tutorial.CategoryId = editedTutorial.CategoryId;
                tutorial.TutorialTypeId = editedTutorial.TutorialTypeId;
                tutorial.Desc = editedTutorial.Desc;
                tutorial.Active = editedTutorial.Active;

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name", editedTutorial.CategoryId);
            ViewBag.TutorialTypeId = new SelectList(db.TutorialTypes, "Id", "Name", editedTutorial.TutorialTypeId);
            return View(tutorial);
        }

        // GET: Tutorials/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tutorial tutorial = db.Tutorials.Find(id);
            if (tutorial == null)
            {
                return HttpNotFound();
            }
            return View(tutorial);
        }

        // POST: Tutorials/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tutorial tutorial = db.Tutorials.Find(id);
            if (tutorial.Commentings.Count() !=0)
            {
                var comments = tutorial.Commentings.ToList();
                db.Commentings.RemoveRange(comments);
                db.SaveChanges();
            }
            if (tutorial.Ratings.Count() !=0)
            {
                var rates = tutorial.Ratings.ToList();
                db.Ratings.RemoveRange(rates);
                db.SaveChanges();
            }
            db.Tutorials.Remove(tutorial);
            db.SaveChanges();
            return RedirectToAction("Index");
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
