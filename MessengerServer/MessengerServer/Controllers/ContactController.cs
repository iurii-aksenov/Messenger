using AutoMapper;
using MessengerServer.BusinessLogicLayer.DataTransferObjects;
using MessengerServer.BusinessLogicLayer.Infrastructure;
using MessengerServer.BusinessLogicLayer.Interfaces;
using MessengerServer.PresentationLayer.Models;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;

namespace MessengerServer.PresentationLayer.Controllers
{
    [RoutePrefix("contact")]
    public class ContactController : ApiController
    {
        IContactService contactService;
        public ContactController(IContactService service)
        {
            contactService = service;
        }

        [Route("account/{phone}/{password}")]
        [HttpGet]
        public IHttpActionResult GetAccount(string phone,string password)
        {
            Log.Information("Getting Account");
            try
            {
                AccountDTO accountDTO = contactService.GetAccount(phone,password);
                Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, AccountViewModel>());
                var account = Mapper.Map<AccountDTO, AccountViewModel>(accountDTO);
                return Ok(account);
            }
            catch (ValidationException ex)
            {
                ModelState.AddModelError(ex.Property, ex.Message);
                return NotFound();
            }

            
        }


        protected override void Dispose(bool disposing)
        {
            contactService.Dispose();
            base.Dispose(disposing);
        }

    }
}
