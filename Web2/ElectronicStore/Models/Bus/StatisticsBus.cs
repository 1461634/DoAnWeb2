using ElectronicStoreConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ElectronicStore.Models.Bus
{
    public class StatisticsBus
    {
        public static IEnumerable<View_DayStatistic> DayStatistics()
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<View_DayStatistic>("SELECT * FROM View_DayStatistics");
            }
        }

        public static IEnumerable<View_WeekStatistic> WeekStatistics()
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<View_WeekStatistic>("SELECT * FROM View_WeekStatistics");
            }
        }

        public static IEnumerable<View_MonthStatistic> MonthStatistics()
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<View_MonthStatistic>("SELECT * FROM View_MonthStatistics");
            }
        }

        public static IEnumerable<View_YearStatistic> YearStatistics()
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<View_YearStatistic>("SELECT * FROM View_YearStatistics");
            }
        }

        public static IEnumerable<View_ThreeMonthsStatistic> ThreeMonthsStatistics()
        {
            using (var db = new ElectronicStoreConnectionDB())
            {
                return db.Query<View_ThreeMonthsStatistic>("SELECT * FROM View_ThreeMonthsStatistics");
            }
        }
    }
}