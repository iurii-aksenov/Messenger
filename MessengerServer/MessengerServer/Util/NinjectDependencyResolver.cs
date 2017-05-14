using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Ninject;
using System.Collections.Generic;
using System;
using MessengerServer.BusinessLogicLayer.Interfaces;
using MessengerServer.BusinessLogicLayer.Services;
using Ninject.Modules;
using Ninject.Web.WebApi;
using System.Web.Http.Dependencies;

namespace MessengerServer.PresentationLayer.Util
{
    /// <summary>
    /// Класс сопоставитель зависимостей. Где мы внедряем зависимости.
    /// </summary>
    public class NinjectDependencyResolver : NinjectDependencyScope, IDependencyResolver, System.Web.Mvc.IDependencyResolver
    {
        private IKernel kernel;
        public NinjectDependencyResolver(IKernel kernelParam) : base(kernelParam)
        {
            kernel = kernelParam;
            AddBindings();
        }
        //public object GetService(Type serviceType)
        //{
        //    return kernel.TryGet(serviceType);
        //}
        //public IEnumerable<object> GetServices(Type serviceType)
        //{
        //    return kernel.GetAll(serviceType);
        //}
        public IDependencyScope BeginScope()
        {
            return new NinjectDependencyScope(this.kernel.BeginBlock());
        }
        private void AddBindings()
        {
            kernel.Bind<IContactService>().To<ContactService>()
                .WithConstructorArgument("service");
            kernel.Bind<IListService>().To<ListService>();
        }
    }
}
