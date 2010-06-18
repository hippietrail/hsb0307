using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ReferenceNews.Product
{
    class ProductInfo
    {
        private string ProductId;   //商品编号
        public string FProductId
        {
            get { return ProductId; }
            set { ProductId = value; }
        }

        private string Name;      //商品名称 
        public string FName
        {
            get { return Name; }
            set { Name = value; }
        }

        private string Specification;      //商品规格
        public string FSpecification
        {
            get { return Specification; }
            set { Specification = value; }
        }

        private string CreatedDate;      //商品创建日期 
        public string FCreatedDate
        {
            get { return CreatedDate; }
            set { CreatedDate = value; }
        }

        private string ModifiedDate;      //商品修改日期 
        public string FModifiedDate
        {
            get { return ModifiedDate; }
            set { ModifiedDate = value; }
        }

        private int ModifiedBy;      //商品修改者
        public int FModifiedBy
        {
            get { return ModifiedBy; }
            set { ModifiedBy = value; }
        }


        private int CreatedBy;      //商品修改者
        public int FCreatedBy
        {
            get { return CreatedBy; }
            set { CreatedBy = value; }
        }

        private int IsDeleted;      //商品是否被删除
        public int FIsDeleted
        {
            get { return IsDeleted; }
            set { IsDeleted = value; }
        }
    }
}
