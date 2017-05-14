using AutoMapper;
using MessengerServer.BusinessLogicLayer.DataTransferObjects;
using MessengerServer.BusinessLogicLayer.Infrastructure;
using MessengerServer.BusinessLogicLayer.Interfaces;
using MessengerServer.BusinessLogicLayer.Services;
using MessengerServer.PresentationLayer.Models;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Web.Mvc;

namespace MessengerServer.PresentationLayer.Controllers
{
    [RoutePrefix("contact")]
    public class ContactController : Controller
    {
        private IContactService contactService;
        
        public ContactController(IContactService serv)
        {
            contactService = serv;
        }

        [Route("test")]
        [HttpGet]
        public ActionResult GetLongTask()
        {

            return Json("Long task complete", JsonRequestBehavior.AllowGet);
        }

        [Route("account/{phone}/{password}")]
        [HttpGet]
        public ActionResult GetAccount(string phone,string password)
        {
            Console.WriteLine("Hello");
            try
            {
                Console.WriteLine(phone + " " + password);
                AccountDTO accountDTO = contactService.GetAccount(phone,password);
                Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, AccountViewModel>());
                var account = Mapper.Map<AccountDTO, AccountViewModel>(accountDTO);
                
                return Json(account, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                ModelState.AddModelError(ex.Property, ex.Message);
                Console.WriteLine(ex.Message);
                return Json("Hello", JsonRequestBehavior.AllowGet);
            }
        }

        [Route("account/{id}")]
        [HttpGet]
        public ActionResult GetAccount(int? id)
        {
            id = 1;
            try
            {
                Console.WriteLine(id);
                AccountDTO accountDTO = contactService.GetAccount(id);
                Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, AccountViewModel>());
                var account = Mapper.Map<AccountDTO, AccountViewModel>(accountDTO);

                return Json(account, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                ModelState.AddModelError(ex.Property, ex.Message);
                
                return Json(ex.Message, JsonRequestBehavior.AllowGet);
            }
        }

        protected override void Dispose(bool disposing)
        {
            contactService.Dispose();
            base.Dispose(disposing);
        }

    }
}
