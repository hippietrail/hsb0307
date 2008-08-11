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
        /// <summary>
        /// 获取指定部门的所有子级部门，不是直接子部门，是递归得到的所有下级部门
        /// </summary>
        /// <param name="id">指定部门的id</param>
        /// <param name="includeSelf">返回结果中是否包含当前部门</param>
        /// <returns></returns>
        public DepartmentTable GetChildrenDepartment(Guid? id, bool includeSelf)
        {
            DepartmentTable dt = GetAll();

            DepartmentTable s = new DepartmentTable();

            if (dt.Rows.Count == 0) return s;

            DataView dv = dt.DefaultView;

            dv.RowFilter = " Id = '" + id.ToString() + "'";
            if (includeSelf)
            {
                s.ImportRow(dv[0].Row);
            }

            if (((DepartmentRow)dv[0].Row).IsParentIdNull())
            {
                dv.RowFilter = " ParentId IS NULL ";
            }
            else
            {
                dv.RowFilter = " ParentId = '" + id.ToString() + "'";
            }

            foreach (DataRowView r in dv)
            {
                //TestDataSet.DepartmentsRow row = s.NewDepartmentsRow();
                if (!((DepartmentRow)dv[0].Row).IsParentIdNull())
                {
                    s.ImportRow(r.Row);
                }

                AddDepartmentRow(dt, s, ((DepartmentRow)r.Row).Id);
            }

            return s;

        }
        /// <summary>
        /// 在部门表中插入当前部门的部门
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="s"></param>
        /// <param name="id"></param>
        private void AddDepartmentRow(DepartmentTable dt, DepartmentTable s, Guid id)
        {
            foreach (DepartmentRow row in dt.Rows)
            {
                if (!row.IsParentIdNull() && row.ParentId == id)
                {
                    s.ImportRow(row);

                    AddDepartmentRow(dt, s, row.Id);
                }
            }
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

        /// <summary>
        /// 得到所有广告公司
        /// </summary>
        /// <returns></returns>
        public static DepartmentTable GetCompany()
        {
            DepartmentAdapter adapter = new DepartmentAdapter();
            return adapter.GetCompany();
        }
    }
}
