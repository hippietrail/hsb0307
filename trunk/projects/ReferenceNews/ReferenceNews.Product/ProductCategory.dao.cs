using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ReferenceNews.Product
{
    class ProductCategory
    {
        #region Common StoredProcedure or SQL  List

        protected override string InsertStatement
        {
            get { return "Production.ProductCategory_InsertProductCategory"; }
        }

        protected override string CreateDetailStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string CreateMasterStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string CreateUpdateStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string DeleteByIdStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string DeleteByObjectStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string DeleteDetailByIdStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetByIdStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetByNameStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetMasterObjectStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetValueByIdStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string UpdateDetailStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string UpdateMasterStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string UpdateStatement
        {
            get { throw new NotImplementedException(); }
        }

        #endregion


        public override void LoadProperty(System.Data.IDataReader dr)
        {
            Id = (System.Int32)dr[IdProperty.Name];
            Name = (System.String)dr[NameProperty.Name];
            RowId = (System.Guid)dr[RowIdProperty.Name];
            CreatedDate = dr[CreatedDateProperty.Name].ToString();
            CreatedBy = dr[CreatedByProperty.Name] == DBNull.Value ? -1 : (System.Int32)dr[ProductCategory.CreatedByProperty.Name];
            ModifiedDate = dr[ModifiedDateProperty.Name].ToString();
            ModifiedBy = dr[ModifiedByProperty.Name] == DBNull.Value ? -1 : (System.Int32)dr[ProductCategory.ModifiedByProperty.Name];
            DeletedFlag = (System.Boolean)dr[DeletedFlagProperty.Name];
            Description = dr[DescriptionProperty.Name] == DBNull.Value ? "" : (System.String)dr[ProductCategory.DescriptionProperty.Name];

        }

        public override void PopulateParamters(ProductCategory entity, Microsoft.Practices.EnterpriseLibrary.Data.Database db, System.Data.Common.DbCommand cmd)
        {
            db.AddInParameter(cmd, IdProperty.Name, DbType.Int32, entity.Id);
            db.AddInParameter(cmd, NameProperty.Name, DbType.String, entity.Name);
            db.AddInParameter(cmd, RowIdProperty.Name, DbType.Guid, entity.RowId);
            db.AddInParameter(cmd, CreatedDateProperty.Name, DbType.DateTime, entity.CreatedDate);
            db.AddInParameter(cmd, CreatedByProperty.Name, DbType.Int32, entity.CreatedBy);
            db.AddInParameter(cmd, ModifiedDateProperty.Name, DbType.DateTime, entity.ModifiedDate);
            db.AddInParameter(cmd, ModifiedByProperty.Name, DbType.Int32, entity.ModifiedBy);
            db.AddInParameter(cmd, DeletedFlagProperty.Name, DbType.Boolean, entity.DeletedFlag);
            db.AddInParameter(cmd, DescriptionProperty.Name, DbType.String, entity.Description);
        }

        
    }
}
