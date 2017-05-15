using AutoMapper;
using MessengerServer.BusinessLogicLayer.DataTransferObjects;
using MessengerServer.BusinessLogicLayer.Infrastructure;
using MessengerServer.BusinessLogicLayer.Interfaces;
using MessengerServer.PresentationLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MessengerServer.PresentationLayer.Controllers
{
    [RoutePrefix("lists")]
    public class ListController : Controller
    {
        private IListService listService;
        public ListController(IListService serv)
        {
            listService = serv;
        }

        [Route("list/{list}/{account}")]
        [HttpPost]
        public ActionResult CreateList(ListViewModel list, AccountViewModel account)
        {
            try
            {
                Mapper.Initialize(cfg => cfg.CreateMap<ListViewModel, ListDTO>());
                var listDTO = Mapper.Map<ListViewModel, ListDTO>(list);

                Mapper.Initialize(cfg => cfg.CreateMap<AccountViewModel, AccountDTO>());
                var accountDTO = Mapper.Map<AccountViewModel, AccountDTO>(account);

                listService.CreateListByAccount(listDTO, accountDTO);

                return Json("Список контактов создан", JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        [Route("list/{contacts}/{account}")]
        [HttpPost]
        public ActionResult PostContacts(IEnumerable<ContactViewModel> contacts, AccountViewModel account)
        {
            try
            {
                Mapper.Initialize(cfg => cfg.CreateMap<IEnumerable<ContactViewModel>, IEnumerable<ContactDTO>>());
                var contactsDTO = Mapper.Map<IEnumerable<ContactViewModel>, IEnumerable<ContactDTO>>(contacts);

                Mapper.Initialize(cfg => cfg.CreateMap<AccountViewModel, AccountDTO>());
                var accountDTO = Mapper.Map<AccountViewModel, AccountDTO>(account);

                listService.InsertContactsIntoListByAccount(contactsDTO, accountDTO);

                return Json("Контакты загружены", JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        [Route("list/{accountId}")]
        [HttpGet]
        public ActionResult GetList(int? accountId)
        {
            try
            {

                var listDTO = listService.GetListByAccount(accountId);

                Mapper.Initialize(cfg =>  
                {
                    cfg.CreateMap<ListDTO, ListViewModel>();
                    cfg.CreateMap<ContactDTO, ContactViewModel>();
                } );
                
                var list = Mapper.Map<ListDTO, ListViewModel>(listDTO);

                return Json(list, JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        //[Route("list/{account}")]
        //[HttpGet]
        //public ActionResult GetList(AccountViewModel account)
        //{
        //    try
        //    {
        //        Mapper.Initialize(cfg => cfg.CreateMap<AccountViewModel, AccountDTO>());
        //        var accountDTO = Mapper.Map<AccountViewModel, AccountDTO>(account);

        //        var listDTO = listService.GetListByAccount(accountDTO);

        //        Mapper.Initialize(cfg => cfg.CreateMap<ListDTO, ListViewModel>());
        //        var list = Mapper.Map<ListDTO, ListViewModel>(listDTO);

        //        return Json(list, JsonRequestBehavior.AllowGet);
        //    }
        //    catch (ValidationException ex)
        //    {
        //        return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
        //    }
        //}

        [Route("list/{contacts}/{account}")]
        [HttpDelete]
        public ActionResult DeleteContacts(IEnumerable<ContactViewModel> contacts, AccountViewModel account)
        {
            try
            {
                Mapper.Initialize(cfg => cfg.CreateMap<IEnumerable<ContactViewModel>, IEnumerable<ContactDTO>>());
                var contactsDTO = Mapper.Map<IEnumerable<ContactViewModel>, IEnumerable<ContactDTO>>(contacts);

                Mapper.Initialize(cfg => cfg.CreateMap<AccountViewModel, AccountDTO>());
                var accountDTO = Mapper.Map<AccountViewModel, AccountDTO>(account);

                listService.DeleteContactsFromListByAccount(contactsDTO, accountDTO);

                return Json("Контакты удалены", JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        [Route("list/{list}")]
        [HttpDelete]
        public ActionResult DeleteList(ListViewModel list)
        {
            try
            {
                Mapper.Initialize(cfg => cfg.CreateMap<ListViewModel, ListDTO>());
                var listDTO = Mapper.Map<ListViewModel, ListDTO>(list);

                
                listService.DeleteList(listDTO);

                return Json("Список контактов удален", JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        [Route("list/{account}")]
        [HttpDelete]
        public ActionResult DeleteList(AccountViewModel account)
        {
            try
            {

                Mapper.Initialize(cfg => cfg.CreateMap<AccountViewModel, AccountDTO>());
                var accountDTO = Mapper.Map<AccountViewModel, AccountDTO>(account);

                listService.DeleteList(accountDTO);

                return Json("Список контактов удален", JsonRequestBehavior.AllowGet);
            }
            catch (ValidationException ex)
            {
                return Json("Exception: " + ex.Message + "\nPropery: " + ex.Property, JsonRequestBehavior.AllowGet);
            }
        }

        protected override void Dispose(bool disposing)
        {
            listService.Dispose();
            base.Dispose(disposing);
        }
    }
}