using System;
using System.Collections.Generic;
using System.Data;
using Hg.Model;
using Hg.DALFactory;

namespace Hg.CMS
{
    public class Upload
    {
        private IrootPublic ir;
        public Upload()
        {
            ir = DataAccess.CreaterootPublic();
        }
        public DataTable getUploadInfo()
        {
            DataTable dt = ir.getUploadInfo();
            return dt;
        }
    }
}
