[assembly: WebActivatorEx.PreApplicationStartMethod(typeof(MessengerServer.PresentationLayer.App_Start.NinjectWebCommon), "Start")]
[assembly: WebActivatorEx.ApplicationShutdownMethodAttribute(typeof(MessengerServer.PresentationLayer.App_Start.NinjectWebCommon), "Stop")]

namespace MessengerServer.PresentationLayer.App_Start
{
    using System;
    using System.Web;

    using System.Web.Http;
    using Ninject.Web.WebApi;

    using Microsoft.Web.Infrastructure.DynamicModuleHelper;

    using Ninject;
    using Ninject.Web.Common;
    using Ninject.Modules;
    using BusinessLogicLayer.Infrastructure;
    using BusinessLogicLayer.Services;
    using BusinessLogicLayer.Interfaces;

    public static class NinjectWebCommon 
    {
        private static readonly Bootstrapper bootstrapper = new Bootstrapper();

        /// <summary>
        /// Starts the application
        /// </summary>
        public static void Start() 
        {
            DynamicModuleUtility.RegisterModule(typeof(OnePerRequestHttpModule));
            DynamicModuleUtility.RegisterModule(typeof(NinjectHttpModule));
            bootstrapper.Initialize(CreateKernel);
        }
        
        /// <summary>
        /// Stops the application.
        /// </summary>
        public static void Stop()
        {
            bootstrapper.ShutDown();
        }
        
        /// <summary>
        /// Creates the kernel that will manage your application.
        /// </summary>
        /// <returns>The created kernel.</returns>
        private static IKernel CreateKernel()
        {
            //устанавливаем строку подключения
            var modules = new INinjectModule[] { new ServiceModule("name=MessengerContext")};
            var kernel = new StandardKernel(modules);
            try
            {
                kernel.Bind<Func<IKernel>>().ToMethod(ctx => () => new Bootstrapper().Kernel);
                kernel.Bind<IHttpModule>().To<HttpApplicationInitializationHttpModule>();

                RegisterServices(kernel);
                GlobalConfiguration.Configuration.DependencyResolver = new NinjectDependencyResolver(kernel);
                return kernel;
            }
            catch
            {
                kernel.Dispose();
                throw;
            }
        }

        /// <summary>
        /// Load your modules or register your services here!
        /// </summary>
        /// <param name="kernel">The kernel.</param>
        private static void RegisterServices(IKernel kernel)
        {
             var ninjectResolver = new MessengerServer.PresentationLayer.Util.NinjectDependencyResolver(kernel);
             System.Web.Mvc.DependencyResolver.SetResolver(ninjectResolver); // MVC
             //GlobalConfiguration.Configuration.DependencyResolver = ninjectResolver; // Web API
            //kernel.Bind<IContactService>().To<ContactService>();
            //kernel.Bind<IListService>().To<ListService>();
            //System.Web.Mvc.DependencyResolver.SetResolver(new MessengerServer.PresentationLayer.Util.NinjectDependencyResolver(kernel));

        }        
    }
}
