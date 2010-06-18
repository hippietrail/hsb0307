using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ReferenceNews.Product
{
    public partial class Product
    {
        #region Common StoredProcedure or SQL  List

        protected override string GetMasterObjectStatement
        {
            get { throw new NotImplementedException(); }
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
            get { return "Production.Product_SelectProduct"; }
        }

        protected override string GetByNameStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetValueByIdStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string InsertStatement
        {
            get { return "Production.Product_InsertProduct"; }
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
            //throw new NotImplementedException();

            Id = (System.Int32)dr[IdProperty.Name];
            RowId = (System.Guid)dr[RowIdProperty.Name];
            ProductId = dr[ProductIdProperty.Name] == DBNull.Value ? "" : (System.String)dr[Product.ProductIdProperty.Name];
            Category = dr[CategoryProperty.Name] == DBNull.Value ? -1 : (System.Int32)dr[Product.CategoryProperty.Name];
            Name = (System.String)dr[NameProperty.Name];
            Specification = dr[SpecificationProperty.Name] == DBNull.Value ? "" : (System.String)dr[Product.SpecificationProperty.Name];
            StartDate = dr[StartDateProperty.Name] == DBNull.Value ? DateTime.MinValue.ToString() : dr[Product.StartDateProperty.Name].ToString();
            EndDate = dr[EndDateProperty.Name] == DBNull.Value ? DateTime.MinValue.ToString() : dr[Product.EndDateProperty.Name].ToString();
            StandardPrice = (System.Decimal)dr[StandardPriceProperty.Name];
            OrderPrice = (System.Decimal)dr[OrderPriceProperty.Name];
            Status = dr[StatusProperty.Name] == DBNull.Value ? -1 : (System.Int32)dr[Product.StatusProperty.Name];
            CreatedDate = dr[CreatedDateProperty.Name].ToString();
            CreatedBy = dr[CreatedByProperty.Name] == DBNull.Value ? -1 : (System.Int32)dr[Product.CreatedByProperty.Name];
            ModifiedDate = dr[ModifiedDateProperty.Name].ToString();
            ModifiedBy = dr[ModifiedByProperty.Name] == DBNull.Value ? -1 : (System.Int32)dr[Product.ModifiedByProperty.Name];
            DeletedFlag = (System.Boolean)dr[DeletedFlagProperty.Name];
            Description = dr[DescriptionProperty.Name] == DBNull.Value ? "" : (System.String)dr[Product.DescriptionProperty.Name];
        }

        public override void PopulateParamters(Product entity, Microsoft.Practices.EnterpriseLibrary.Data.Database db, System.Data.Common.DbCommand cmd)
        {
            //throw new NotImplementedException();

            //db.AddInParameter(cmd, IdProperty.Name, DbType.Int32, entity.Id);
            db.AddInParameter(cmd, RowIdProperty.Name, DbType.Guid, entity.RowId);
            db.AddInParameter(cmd, ProductIdProperty.Name, DbType.AnsiString, entity.ProductId);
            db.AddInParameter(cmd, CategoryProperty.Name, DbType.Int32, entity.Category);
            db.AddInParameter(cmd, NameProperty.Name, DbType.String, entity.Name);
            db.AddInParameter(cmd, SpecificationProperty.Name, DbType.String, entity.Specification);
            db.AddInParameter(cmd, StartDateProperty.Name, DbType.DateTime, entity.StartDate);
            db.AddInParameter(cmd, EndDateProperty.Name, DbType.DateTime, entity.EndDate);
            db.AddInParameter(cmd, StandardPriceProperty.Name, DbType.Currency, entity.StandardPrice);
            db.AddInParameter(cmd, OrderPriceProperty.Name, DbType.Currency, entity.OrderPrice);
            db.AddInParameter(cmd, StatusProperty.Name, DbType.Int32, entity.Status);
            db.AddInParameter(cmd, CreatedDateProperty.Name, DbType.DateTime, entity.CreatedDate);
            db.AddInParameter(cmd, CreatedByProperty.Name, DbType.Int32, entity.CreatedBy);
            db.AddInParameter(cmd, ModifiedDateProperty.Name, DbType.DateTime, entity.ModifiedDate);
            db.AddInParameter(cmd, ModifiedByProperty.Name, DbType.Int32, entity.ModifiedBy);
            db.AddInParameter(cmd, DeletedFlagProperty.Name, DbType.Boolean, entity.DeletedFlag);
            db.AddInParameter(cmd, DescriptionProperty.Name, DbType.String, entity.Description);
        }
    }
}
