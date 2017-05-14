using AutoMapper;
using MessengerServer.BusinessLogicLayer.DataTransferObjects;
using MessengerServer.BusinessLogicLayer.Infrastructure;
using MessengerServer.BusinessLogicLayer.Interfaces;
using MessengerServer.BusinessLogicLayer.Services;
using MessengerServer.PresentationLayer.Models;
using Ninject;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
//using System.Web.Http;
//using System.Web.Mvc;

namespace MessengerServer.PresentationLayer.Controllers
{
    [RoutePrefix("contact")]
    public class ContactController : ApiController
    {
        private IContactService contactService;
        
        public ContactController()
        {
            
        }

        [Route("test")]
        [HttpGet]
        public IHttpActionResult GetLongTask()
        {
            Log.Information("test");

            return Json("Long task complete");
        }

        [Route("account/{phone}/{password}")]
        [HttpGet]
        public IHttpActionResult GetAccount(string phone,string password)
        {
            Console.WriteLine("Hello");
            try
            {
                Console.WriteLine(phone + " " + password);
                AccountDTO accountDTO = contactService.GetAccount(phone,password);
                Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, AccountViewModel>());
                var account = Mapper.Map<AccountDTO, AccountViewModel>(accountDTO);
                
                return Json(account);
            }
            catch (ValidationException ex)
            {
                ModelState.AddModelError(ex.Property, ex.Message);
                Console.WriteLine(ex.Message);
                return Json("Hello");
            }
        }

        [Route("account/{id}")]
        [HttpGet]
        public IHttpActionResult GetAccount(int? id)
        {

            try
            {
                Console.WriteLine(id);
                AccountDTO accountDTO = contactService.GetAccount(id);
                Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, AccountViewModel>());
                var account = Mapper.Map<AccountDTO, AccountViewModel>(accountDTO);

                return Json(account);
            }
            catch (ValidationException ex)
            {
                ModelState.AddModelError(ex.Property, ex.Message);
                Console.WriteLine(ex.Message);
                return Json("Hello");
            }
        }

        protected override void Dispose(bool disposing)
        {
            contactService.Dispose();
            base.Dispose(disposing);
        }

    }
}
