﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;

namespace Hg.DALProfile
{
    public interface IDbBase
    {
        DbCommand CreateCommand();
        DbConnection CreateConnection();
        DbDataAdapter CreateDataAdapter();
        DbParameter CreateParameter();
    }
}
