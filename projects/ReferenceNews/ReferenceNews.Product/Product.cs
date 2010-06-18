using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Csla;
using System.Data;

namespace ReferenceNews.Product
{
    [Serializable()]
    public partial class Product : EntityBase<Product>
    {
        #region 这里是私有构造函数

        private Product()
        { 
            /* require use of factory methods */
        }

        #endregion

        #region 注册属性

        private static PropertyInfo<System.String> ProductIdProperty = RegisterProperty<System.String>(p => p.ProductId);
        private static PropertyInfo<System.Int32> CategoryProperty = RegisterProperty<System.Int32>(p => p.Category);
        private static PropertyInfo<System.String> NameProperty = RegisterProperty<System.String>(p => p.Name);
        private static PropertyInfo<System.String> SpecificationProperty = RegisterProperty<System.String>(p => p.Specification);
        private static PropertyInfo<SmartDate> StartDateProperty = RegisterProperty<SmartDate>(p => p.StartDate);
        private static PropertyInfo<SmartDate> EndDateProperty = RegisterProperty<SmartDate>(p => p.EndDate);
        private static PropertyInfo<System.Decimal> StandardPriceProperty = RegisterProperty<System.Decimal>(p => p.StandardPrice);
        private static PropertyInfo<System.Decimal> OrderPriceProperty = RegisterProperty<System.Decimal>(p => p.OrderPrice);
        private static PropertyInfo<System.Int32> StatusProperty = RegisterProperty<System.Int32>(p => p.Status);

        //public static PropertyInfo<System.DateTime> StartDateProperty = RegisterProperty<System.DateTime>(p => p.StartDate);
        //public static PropertyInfo<System.DateTime> EndDateProperty = RegisterProperty<System.DateTime>(p => p.EndDate);
        #endregion

        #region 属性

        public System.String ProductId
        {
            get { return GetProperty(ProductIdProperty); }
            set { SetProperty(ProductIdProperty, value); }
        }

        public System.Int32 Category
        {
            get { return GetProperty(CategoryProperty); }
            set { SetProperty(CategoryProperty, value); }
        }

        public System.String Name
        {
            get { return GetProperty(NameProperty); }
            set { SetProperty(NameProperty, value); }
        }

        public System.String Specification
        {
            get { return GetProperty(SpecificationProperty); }
            set { SetProperty(SpecificationProperty, value); }
        }
        public System.String StartDate
        {
            get { return GetPropertyConvert<SmartDate, System.String>(StartDateProperty); }
            set { SetPropertyConvert<SmartDate, System.String>(StartDateProperty, value); }
        }
        public System.String EndDate
        {
            get { return GetPropertyConvert<SmartDate, System.String>(EndDateProperty); }
            set { SetPropertyConvert<SmartDate, System.String>(EndDateProperty, value); }
        }

        public System.Decimal StandardPrice
        {
            get { return GetProperty(StandardPriceProperty); }
            set { SetProperty(StandardPriceProperty, value); }
        }

        public System.Decimal OrderPrice
        {
            get { return GetProperty(OrderPriceProperty); }
            set { SetProperty(OrderPriceProperty, value); }
        }

        public System.Int32 Status
        {
            get { return GetProperty(StatusProperty); }
            set { SetProperty(StatusProperty, value); }
        }

        #endregion
        
    }
}
