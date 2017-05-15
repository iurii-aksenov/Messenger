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
    [RoutePrefix("contacts")]
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

        [Route("account/register/{account}")]
        [HttpGet]
        public ActionResult RegisterAccount(AccountViewModel account)
        {
            try
            {
                Mapper.Initialize(cfg => cfg.CreateMap<AccountViewModel, AccountDTO>());
                var accountDTO = Mapper.Map<AccountViewModel, AccountDTO>(account);

                contactService.RegisterAccount(accountDTO);

                Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, AccountViewModel>());
                account = Mapper.Map<AccountDTO, AccountViewModel>(accountDTO);

                return Json(account, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        [Route("account/{id}")]
        [HttpGet]
        public ActionResult GetAccount(int? id)
        {
            try
            {
                AccountDTO accountDTO = contactService.GetAccount(id);
                Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, AccountViewModel>());
                var account = Mapper.Map<AccountDTO, AccountViewModel>(accountDTO);

                return Json(account, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        [Route("account/{phone}/{password}")]
        [HttpGet]
        public ActionResult GetAccount(string phone,string password)
        {
            try
            {
                AccountDTO accountDTO = contactService.GetAccount(phone,password);
                Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, AccountViewModel>());
                var account = Mapper.Map<AccountDTO, AccountViewModel>(accountDTO);
                
                return Json(account, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message+ "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        [Route("account/{phone}/{password}")]
        [HttpPost]
        public ActionResult UpdateAccount(AccountViewModel account)
        {
            try
            {
                Mapper.Initialize(cfg => cfg.CreateMap<AccountViewModel, AccountDTO>());
                var accountDTO = Mapper.Map<AccountViewModel, AccountDTO>(account);

                contactService.UpdateAccount(accountDTO);

                return Json(account, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }


        [Route("contact/{id}")]
        [HttpGet]
        public ActionResult GetContact(int? id)
        {
            try
            {
                ContactDTO accountDTO = contactService.GetContact(id);
                Mapper.Initialize(cfg => cfg.CreateMap<ContactDTO, ContactViewModel>());
                var contact = Mapper.Map<ContactDTO, ContactViewModel>(accountDTO);

                return Json(contact, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        [Route("contact/{phone}")]
        [HttpGet]
        public ActionResult GetContact(string phone)
        {
            try
            {
                ContactDTO contactDTO = contactService.GetContact(phone);
                Mapper.Initialize(cfg => cfg.CreateMap<ContactDTO, ContactViewModel>());
                var contact = Mapper.Map<ContactDTO, ContactViewModel>(contactDTO);

                return Json(contact, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }


        /**
         * 
           try
            {
                

                return Json(account, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
         * 
         * */

        protected override void Dispose(bool disposing)
        {
            contactService.Dispose();
            base.Dispose(disposing);
        }

    }
}
