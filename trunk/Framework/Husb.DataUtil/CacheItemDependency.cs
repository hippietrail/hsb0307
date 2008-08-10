//===============================================================================
// Microsoft patterns & practices Enterprise Library
// Caching Application Block
//===============================================================================
// Copyright ?Microsoft Corporation.  All rights reserved.
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//===============================================================================

using System;
using System.Globalization;
using System.IO;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;
using System.Security.Permissions;
//using Microsoft.Practices.EnterpriseLibrary.Caching.Properties;

namespace Microsoft.Practices.EnterpriseLibrary.Caching.Expirations
{
    /// <summary>
    ///	This class tracks a CacheItem cache dependency.
    /// </summary>
    [Serializable]
    [ComVisible(false)]
    public class CacheItemDependency : ICacheItemExpiration
    {
        private readonly string dependencyCacheKey;

        private System.Int32 lastCount;

        #region Constructor
        /// <summary>
        ///	Constructor with one argument.
        /// </summary>
        /// <param name="cacheKey">Indicates the key of the cache item</param>
        public CacheItemDependency(string cacheKey)
        {
            dependencyCacheKey = cacheKey;
            ICacheManager cacheManager = CacheFactory.GetCacheManager();
            lastCount = Int32.MinValue;
            if (cacheManager != null)
            {
                if (cacheManager.Contains(cacheKey))
                {
                    lastCount = (int)cacheManager.GetData(cacheKey);
                    //if (lastCount < Int32.MaxValue)
                    //{
                    //    lastCount++;
                    //}
                    //else
                    //{
                    //    lastCount = Int32.MinValue;
                    //}
                    //cacheManager.Add(cacheKey, lastCount);
                    ////cacheManager.Add(cacheKey, cacheValue, CacheItemPriority.Normal, null, new ICacheItemExpiration[] { expiry });
                }
                else
                {
                    cacheManager.Add(cacheKey, lastCount);
                }
            }
        }
        #endregion

        #region Properties
        /// <summary>
        /// Gets the key of the dependent Cache Item.
        /// </summary>
        /// <value>
        /// The key of the dependent Cache Item.
        /// </value>
        public string DependencyCacheKey
        {
            get { return dependencyCacheKey; }
        }
        /// <summary>
        /// Gets the Last Count.
        /// </summary>
        /// <value>
        /// The Count of the last setup.
        /// </value>
        public System.Int32 LastCount
        {
            get { return lastCount; }
        }
        #endregion

        #region ICacheItemExpiration Members
        /// <summary>
        ///	Specifies if the item has expired or not.
        /// </summary>
        /// <returns>Returns true if the item has expired, otherwise false.</returns>
        public bool HasExpired()
        {
            ICacheManager cacheManager = CacheFactory.GetCacheManager();
            //throw new Exception("The method or operation is not implemented.");
            if (cacheManager == null)
            {
                return true;
            }

            System.Int32 currentCount = (int)cacheManager.GetData(dependencyCacheKey);
            if (currentCount != lastCount)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        ///	Notifies that the item was recently used.
        /// </summary>
        public void Notify()
        {
        }

        /// <summary>
        /// Not used
        /// </summary>
        /// <param name="owningCacheItem">Not used</param>
        public void Initialize(CacheItem owningCacheItem)
        {
        }
        #endregion
    }
}
