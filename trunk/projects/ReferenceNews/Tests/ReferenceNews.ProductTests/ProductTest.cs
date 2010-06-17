using ReferenceNews.Product;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System;

namespace ReferenceNews.ProductTests
{
    
    
    /// <summary>
    ///这是 ProductTest 的测试类，旨在
    ///包含所有 ProductTest 单元测试
    ///</summary>
    [TestClass()]
    public class ProductTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///获取或设置测试上下文，上下文提供
        ///有关当前测试运行及其功能的信息。
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region 附加测试属性
        // 
        //编写测试时，还可使用以下属性:
        //
        //使用 ClassInitialize 在运行类中的第一个测试前先运行代码
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //使用 ClassCleanup 在运行完类中的所有测试后再运行代码
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //使用 TestInitialize 在运行每个测试前先运行代码
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //使用 TestCleanup 在运行完每个测试后运行代码
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///Status 的测试
        ///</summary>
        [TestMethod()]
        public void StatusTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            int expected = 0; // TODO: 初始化为适当的值
            int actual;
            target.Status = expected;
            actual = target.Status;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("验证此测试方法的正确性。");
        }

        /// <summary>
        ///StartDate 的测试
        ///</summary>
        [TestMethod()]
        public void StartDateTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            string expected = string.Empty; // TODO: 初始化为适当的值
            string actual;
            target.StartDate = expected;
            actual = target.StartDate;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("验证此测试方法的正确性。");
        }

        /// <summary>
        ///StandardPrice 的测试
        ///</summary>
        [TestMethod()]
        public void StandardPriceTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            Decimal expected = new Decimal(); // TODO: 初始化为适当的值
            Decimal actual;
            target.StandardPrice = expected;
            actual = target.StandardPrice;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("验证此测试方法的正确性。");
        }

        /// <summary>
        ///Specification 的测试
        ///</summary>
        [TestMethod()]
        public void SpecificationTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            string expected = string.Empty; // TODO: 初始化为适当的值
            string actual;
            target.Specification = expected;
            actual = target.Specification;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("验证此测试方法的正确性。");
        }

        /// <summary>
        ///ProductId 的测试
        ///</summary>
        [TestMethod()]
        public void ProductIdTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            string expected = string.Empty; // TODO: 初始化为适当的值
            string actual;
            target.ProductId = expected;
            actual = target.ProductId;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("验证此测试方法的正确性。");
        }

        /// <summary>
        ///OrderPrice 的测试
        ///</summary>
        [TestMethod()]
        public void OrderPriceTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            Decimal expected = new Decimal(); // TODO: 初始化为适当的值
            Decimal actual;
            target.OrderPrice = expected;
            actual = target.OrderPrice;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("验证此测试方法的正确性。");
        }

        /// <summary>
        ///Name 的测试
        ///</summary>
        [TestMethod()]
        public void NameTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            string expected = string.Empty; // TODO: 初始化为适当的值
            string actual;
            target.Name = expected;
            actual = target.Name;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("验证此测试方法的正确性。");
        }

        /// <summary>
        ///EndDate 的测试
        ///</summary>
        [TestMethod()]
        public void EndDateTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            string expected = string.Empty; // TODO: 初始化为适当的值
            string actual;
            target.EndDate = expected;
            actual = target.EndDate;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("验证此测试方法的正确性。");
        }

        /// <summary>
        ///Category 的测试
        ///</summary>
        [TestMethod()]
        public void CategoryTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            int expected = 0; // TODO: 初始化为适当的值
            int actual;
            target.Category = expected;
            actual = target.Category;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("验证此测试方法的正确性。");
        }

        /// <summary>
        ///PopulateParamters 的测试
        ///</summary>
        [TestMethod()]
        public void PopulateParamtersTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            Product.Product entity = null; // TODO: 初始化为适当的值
            Database db = null; // TODO: 初始化为适当的值
            DbCommand cmd = null; // TODO: 初始化为适当的值
            target.PopulateParamters(entity, db, cmd);
            Assert.Inconclusive("无法验证不返回值的方法。");
        }

        /// <summary>
        ///LoadProperty 的测试
        ///</summary>
        [TestMethod()]
        public void LoadPropertyTest()
        {
            Product_Accessor target = new Product_Accessor(); // TODO: 初始化为适当的值
            IDataReader dr = null; // TODO: 初始化为适当的值
            target.LoadProperty(dr);
            Assert.Inconclusive("无法验证不返回值的方法。");
        }

        /// <summary>
        ///Product 构造函数 的测试
        ///</summary>
        [TestMethod()]
        [DeploymentItem("ReferenceNews.Product.dll")]
        public void ProductConstructorTest()
        {
            Product_Accessor target = new Product_Accessor();
            Assert.Inconclusive("TODO: 实现用来验证目标的代码");
        }

        // ===========================================================

        [TestMethod()]
        public void ProductCreateTest()
        {
            Product.Product target = Product.Product.Create();



            Assert.IsNotNull(target);
        }

        [TestMethod()]
        public void ProductSaveTest()
        {
            Product.Product target = GetMock();

            target.Save();

            //Product.Product t = Product.Product.GetById(target.RowId);
            Assert.IsNotNull(target);
        }

        private Product.Product GetMock()
        {
            Product.Product mock = Product.Product.Create();

            mock.RowId = new Guid("96a1ab2d-1a49-4c2d-9791-d7c41bce5c40");
            mock.ProductId = "RIVARQDBUNSRYGCKJBKSFIRBXBDTZVMBQPRNGIDTXGEKDHUMIOTDLIVJRUDQNLD";
            mock.Category = (int)45;
            mock.Name = "CCOROOVESDWQYOXJGTDNSAMKEFDKQJCYKE[HGYCCA[URXROMOAEZYJQCQENJLLOJBZHUOQDIRBNSGVONRSVQFD[AOYRCLURPMMQYKUXYXWIXXYWVQARTQYDYZGGQZBY";
            mock.Specification = "LGPCNQNUTHYBRCHRQKFODHIJQMZXKZLXZNXKKMVIPJQT[GDHXFKQHEDEYFMBSQLUXBCEFXIEPXZURPJKKSZFPVQVKTNE[UQZZWXZEYCAXFBKFJNIWCR[RFFCLHUMKDFVHZVUTKGLQZIJTGQBGEIXDQJTSUPXEQQUBGDGNSQMXGKSXVJERTGGVHSRRCDYVJHZJOJNEKOOOWBXGRWWMKFLLKZTOLPLQSRNZLJJNWAIFSSYHUL[GHNLEWPZPQZSUDYXGNZVIOKQKXGTSBMUAQFJFGJCWKTXXINDTWTTWQRSXXBHRWHPDFSFXPRAEWZZVMTCKD[WITYKYNMIFDMACFUSQIFEETPZRTYLDZWOWLGKHJHKDJVBLZWQSBNCYWSQEZTFQBFGGYERYKLHCWAVXOPSWISCMUQATRGIQBUCEPVNUGSIQG[CVXSQKAJIJDUMIEXIEDRBCYRITCYRQKMHVOFWYQYQSMTBVJEQIKENOZAXGKXICSSZRNR";
            mock.StartDate = new DateTime(2010, 6, 17, 9, 17, 11, 1).ToString();
            mock.EndDate = new DateTime(2010, 6, 17, 9, 17, 11, 95).ToString();
            mock.StandardPrice = 133;
            mock.OrderPrice = 249;
            mock.Status = (int)146;
            mock.CreatedDate = new DateTime(2010, 6, 17, 9, 17, 11, 407).ToString();
            mock.CreatedBy = (int)14;
            mock.ModifiedDate = new DateTime(2010, 6, 17, 9, 17, 11, 501).ToString();
            mock.ModifiedBy = (int)249;
            mock.IsDeleted = false;
            mock.Description = "LGPCNQNUTHYBRCHRQKFODHIJQMZXKZLXZNXKKMVIPJQT[GDHXFKQHEDEYFMBSQLUXBCEFXIEPXZURPJKKSZFPVQVKTNE[UQZZWXZEYCAXFBKFJNIWCR[RFFCLHUMKDFVHZVUTKGLQZIJTGQBGEIXDQJTSUPXEQQUBGDGNSQMXGKSXVJERTGGVHSRRCDYVJHZJOJNEKOOOWBXGRWWMKFLLKZTOLPLQSRNZLJJNWAIFSSYHUL[GHNLEWPZPQZSUDYXGNZVIOKQKXGTSBMUAQFJFGJCWKTXXINDTWTTWQRSXXBHRWHPDFSFXPRAEWZZVMTCKD[WITYKYNMIFDMACFUSQIFEETPZRTYLDZWOWLGKHJHKDJVBLZWQSBNCYWSQEZTFQBFGGYERYKLHCWAVXOPSWISCMUQATRGIQBUCEPVNUGSIQG[CVXSQKAJIJDUMIEXIEDRBCYRITCYRQKMHVOFWYQYQSMTBVJEQIKENOZAXGKXICSSZRNR";

            return (Product.Product)mock;

        }


    }
}
