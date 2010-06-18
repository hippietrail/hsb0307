using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Csla;

namespace ReferenceNews.Product
{
    public class ProductCategoryList : EntityListBase<ProductCategoryList, ProductCategory>
    {
        #region Common StoredProcedure or SQL  List

        protected override string FetchByNameStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetAllByOwnerStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetAllStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetByMasterIdStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetDetailObjectStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetPagedStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetRowCountStatement
        {
            get { throw new NotImplementedException(); }
        }

        protected override string GetStatement
        {
            get { throw new NotImplementedException(); }
        }

        #endregion
    }
}
