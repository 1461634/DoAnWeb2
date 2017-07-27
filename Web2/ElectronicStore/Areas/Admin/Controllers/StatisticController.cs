using ElectronicStore.Models.Bus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace ElectronicStore.Areas.Admin.Controllers
{
    public class StatisticController : Controller
    {
        // GET: Admin/Statistic
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult DayStatistics(int page = 1, int pageSize = 3)
        {
            return View(StatisticsBus.DayStatistics().ToPagedList(page, pageSize));
        }

        public ActionResult WeekStatistics(int page = 1, int pageSize = 3)
        {
            return View(StatisticsBus.WeekStatistics().ToPagedList(page, pageSize));
        }

        public ActionResult MonthStatistics(int page = 1, int pageSize = 3)
        {
            return View(StatisticsBus.MonthStatistics().ToPagedList(page, pageSize));
        }

        public ActionResult YearStatistics(int page = 1, int pageSize = 3)
        {
            return View(StatisticsBus.YearStatistics().ToPagedList(page, pageSize));
        }

        public ActionResult QuarterStatistics(int page = 1, int pageSize = 3)
        {
            return View(StatisticsBus.ThreeMonthsStatistics().ToPagedList(page, pageSize));
        }
    }
}