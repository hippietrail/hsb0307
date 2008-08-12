using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Data;

using Husb.Data;
using WinClientDemo.Data;
using DepartmentTable = WinClientDemo.Data.Departments.DepartmentDataTable;
using DepartmentRow = WinClientDemo.Data.Departments.DepartmentRow;
using Husb.DataUtil;
using Microsoft.Practices.EnterpriseLibrary.Caching;

namespace WinClientDemo.DataAccess
{
    public class DepartmentAdapter : DataAccessAdapter<Departments, DepartmentTable>
    {
        public DepartmentAdapter()
        {
            this.TableName = "Department";

            GetAllStoredProc = "Admin.Departments_SelectDepartmentsAll";
            InsertStoredProc = "Admin.Departments_InsertDepartment";
            UpdateStoredProc = "Admin.Departments_UpdateDepartment";
            DeleteStoredProc = "Admin.Departments_DeleteDepartment";
        }

        protected override void PopulateUpdateParamters(Database db, DbCommand cmd)
        {
            PopulateInsertParamters(db, cmd);
        }

        protected override void PopulateDeleteParamters(Database db, DbCommand cmd)
        {
            db.AddInParameter(cmd, "Id", DbType.Guid, "Id", DataRowVersion.Current);
        }

        protected override void PopulateInsertParamters(Database db, DbCommand cmd)
        {
            db.AddInParameter(cmd, "Id", DbType.Guid, "Id", DataRowVersion.Current);
            db.AddInParameter(cmd, "Name", DbType.String, "Name", DataRowVersion.Current);
            db.AddInParameter(cmd, "ParentId", DbType.Guid, "ParentId", DataRowVersion.Current);
            db.AddInParameter(cmd, "Category", DbType.String, "Category", DataRowVersion.Current);
            db.AddInParameter(cmd, "DepartmentNumber", DbType.AnsiString, "DepartmentNumber", DataRowVersion.Current);
            db.AddInParameter(cmd, "QueryNumber", DbType.AnsiString, "QueryNumber", DataRowVersion.Current);
            //db.AddInParameter(cmd, "IsAdvertising", DbType.Boolean, "IsAdvertising", DataRowVersion.Current);
            db.AddInParameter(cmd, "IsDeleted", DbType.Boolean, "IsDeleted", DataRowVersion.Current);
            db.AddInParameter(cmd, "IsActive", DbType.Boolean, "IsActive", DataRowVersion.Current);
            db.AddInParameter(cmd, "CreatedTime", DbType.DateTime, "CreatedTime", DataRowVersion.Current);
            db.AddInParameter(cmd, "CreatedBy", DbType.Guid, "CreatedBy", DataRowVersion.Current);
            db.AddInParameter(cmd, "ModifiedTime", DbType.DateTime, "ModifiedTime", DataRowVersion.Current);
            db.AddInParameter(cmd, "LastModifiedBy", DbType.Guid, "LastModifiedBy", DataRowVersion.Current);
            db.AddInParameter(cmd, "Version", DbType.Int32, "Version", DataRowVersion.Current);
            db.AddInParameter(cmd, "Description", DbType.String, "Description", DataRowVersion.Current);
        }


        public void GetDapartmentDataSet()
        {
            GetDataSet("Admin.Departments_SelectAllDepartmentsAllEmployee", new List<DatabaseParameter>(), true);
        }

        /// <summary>
        /// 得到根部门
        /// </summary>
        /// <returns></returns>
        public DepartmentTable GetTopDepartment()
        {
            DepartmentTable d = GetAll();
            DataView dv = d.DefaultView;
            dv.RowFilter = "ParentId IS NULL";

            DepartmentTable t = new DepartmentTable();
            foreach (DataRowView rowView in dv)
            {
                t.ImportRow(rowView.Row);
            }

            return t;

            //return GetTable("Admin.Departments_SelectTopDepartment", new List<DatabaseParameter>(), true);
        }

        ///// <summary>
        ///// 得到所有广告公司
        ///// </summary>
        ///// <returns></returns>
        //public DepartmentTable GetCompany()
        //{
        //    return GetTable("Admin.Departments_SelectAdvertingCompany", new List<DatabaseParameter>(), true);
        //}

        /// <summary>
        /// 获取指定部门的所有子级部门，不是直接子部门，是递归得到的所有下级部门
        /// </summary>
        /// <param name="id">指定部门的id</param>
        /// <param name="includeSelf">返回结果中是否包含当前部门</param>
        /// <returns></returns>
        public DepartmentTable GetChildrenDepartment(Guid? id, bool includeSelf)
        {
            ICacheManager cacheManager = CacheFactory.GetCacheManager();
            string key = "Admin.Departments_DepartmentsTree";
            DepartmentTable departments = cacheManager.GetData(key) as DepartmentTable;
            if (departments != null)
            {
                return departments;
            }

            DepartmentTable dt = GetAll();
            DepartmentTable s = new DepartmentTable();
            if (dt.Rows.Count == 0) return s;
            DataView dv = dt.DefaultView;

            dv.RowFilter = " Id = '" + id.ToString() + "'";
            //dv.RowFilter = id == null ? "ParentId IS NULL" : " Id = '" + id.ToString() + "'";
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

            if (s.Rows.Count > 0)
            {
                DataAccessUtil.InsertCache(key, s, cacheManager);
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
    }
}
