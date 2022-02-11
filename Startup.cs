using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TutorialsApp.Startup))]
namespace TutorialsApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
