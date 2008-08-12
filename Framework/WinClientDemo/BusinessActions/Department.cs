using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using Husb.Data;


using DepartmentTable = WinClientDemo.Data.Departments.DepartmentDataTable;
using DepartmentRow = WinClientDemo.Data.Departments.DepartmentRow;

using WinClientDemo.Data;
using WinClientDemo.DataAccess;



namespace WinClientDemo.BusinessActions
{
    public class Department : DataAccessManager<Departments, DepartmentTable, DepartmentAdapter>
    {
        public static DepartmentTable GetDepartmentTree()
        {
            DepartmentAdapter adapter = new DepartmentAdapter();
            DepartmentTable tops = adapter.GetTopDepartment();
            if (tops.Count == 0) return tops;

            return adapter.GetChildrenDepartment(tops[0].Id, true);
        }
        /// <summary>
        /// 得到根部门
        /// </summary>
        /// <returns></returns>
        public static DepartmentTable GetTopDepartment()
        {
            DepartmentAdapter adapter = new DepartmentAdapter();
            
            return adapter.GetTopDepartment();

        }

        /// <summary>
        /// 得到根部门
        /// </summary>
        /// <returns></returns>
        public static DepartmentRow GetRootDepartment()
        {
            DepartmentTable dt = GetTopDepartment();
            if (dt == null || dt.Rows.Count == 0)
            {
                return null;
            }
            return dt[0];
        }
    }
}
