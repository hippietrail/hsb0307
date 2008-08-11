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
            return GetTable("Admin.Departments_SelectTopDepartment", new List<DatabaseParameter>(), true);
        }

        /// <summary>
        /// 得到所有广告公司
        /// </summary>
        /// <returns></returns>
        public DepartmentTable GetCompany()
        {
            return GetTable("Admin.Departments_SelectAdvertingCompany", new List<DatabaseParameter>(), true);
        }
    }
}
