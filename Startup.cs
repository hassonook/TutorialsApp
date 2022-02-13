using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using System.Linq;
using TutorialsApp.Models;

[assembly: OwinStartupAttribute(typeof(TutorialsApp.Startup))]
namespace TutorialsApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            CreateRolesandUsers();
            CreateCategories();
        }
        // In this method we will create default User roles and Admin user for login    
        private static void CreateRolesandUsers()
        {
            ApplicationDbContext context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));


            // In Startup iam creating first Admin Role and creating a default Admin User     
            if (!roleManager.RoleExists("Admin") || roleManager.FindByName("Admin").Users.Count == 0)
            {
                // first we create Admin role   
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = "Admin";
                roleManager.Create(role);


                //Here we create a Admin super user who will maintain the website                   
                var user = new ApplicationUser();
                user.FullName = "Super User";
                user.UserName = "admin@tutorials.com";
                user.Email = "admin@tutorials.com";

                string userPWD = "Admin@123";

                var chkUser = UserManager.Create(user, userPWD);

                //Add default User to Role Admin    
                if (chkUser.Succeeded)
                {
                    var result1 = UserManager.AddToRole(user.Id, "Admin");
                }
            }

            // creating Creating Manager role     
            if (!roleManager.RoleExists("Student"))
            {
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = "Student";
                roleManager.Create(role);

            }
        }
        //Create Categories
        private static void CreateCategories()
        {
            Entities db = new Entities();
            //var categories = db.Categories.ToList();

            // In Startup iam creating first Admin Role and creating a default Admin User     
            if (db.Categories.Count() == 0)
            {
                Category category = new Category();
                category.Name = "Computer Science";
                db.Categories.Add(category);
                db.SaveChanges();
                category.Name = "Arts";
                db.Categories.Add(category);
                db.SaveChanges();
                category.Name = "Engineering";
                db.Categories.Add(category);
                db.SaveChanges();
                category.Name = "Management";
                db.Categories.Add(category);
                db.SaveChanges();
                category.Name = "Economic";
                db.Categories.Add(category);
                db.SaveChanges();

            }
            if (db.TutorialTypes.Count() == 0)
            {
                TutorialType tutorialType = new TutorialType();
                tutorialType.Name = "Book";
                db.TutorialTypes.Add(tutorialType);
                db.SaveChanges();
                tutorialType.Name = "Video";
                db.TutorialTypes.Add(tutorialType);
                db.SaveChanges();

            }


        }
    }
}
