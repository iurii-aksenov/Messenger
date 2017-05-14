using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using Ninject;
using System.Collections.Generic;
using System;
using MessengerServer.BusinessLogicLayer.Interfaces;
using MessengerServer.BusinessLogicLayer.Services;

namespace MessengerServer.PresentationLayer.Util
{
    /// <summary>
    /// Класс сопоставитель зависимостей. Где мы внедряем зависимости.
    /// </summary>
    public class NinjectDependencyResolver : IDependencyResolver
    {
        private IKernel kernel;
        public NinjectDependencyResolver(IKernel kernelParam)
        {
            kernel = kernelParam;
            AddBindings();
        }
        public object GetService(Type serviceType)
        {
            return kernel.TryGet(serviceType);
        }
        public IEnumerable<object> GetServices(Type serviceType)
        {
            return kernel.GetAll(serviceType);
        }
        private void AddBindings()
        {
            kernel.Bind<IContactService>().To<ContactService>();
        }
    }
}
