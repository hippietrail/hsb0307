﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Csla;

namespace ReferenceNews.Product
{
    public class ProductList : EntityListBase<ProductList, Product>
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
            get { return "Production.Product_SelectProductsAll"; }
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
            get { return "Production.Product_SelectProductsPaged"; }
        }

        protected override string GetRowCountStatement
        {
            get { return "Production.Product_SelectProductsRowCount"; }
        }

        protected override string GetStatement
        {
            get { throw new NotImplementedException(); }
        }

        #endregion
    }
}
