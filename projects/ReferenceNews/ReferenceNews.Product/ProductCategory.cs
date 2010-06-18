using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Csla;
using System.Data;

namespace ReferenceNews.Product
{
    [Serializable()]
    public class ProductCategory : EntityBase<ProductCategory>
    {
        private ProductCategory() { }

        
        
        private static PropertyInfo<System.String> NameProperty = RegisterProperty<System.String>(p => p.Name);
        
        public System.String Name
        {
            get { return GetProperty(NameProperty); }
            set { SetProperty(NameProperty, value); }
        }

        
    }
}
