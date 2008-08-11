using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace WinClientDemo
{
    public class UserSettings : ConfigurationSection
    {
        public UserSettings()
        {
        }

        [ConfigurationProperty("name")]
        public string Name
        {
            get { return (string)this["name"]; }
            set { this["name"] = value; }
        }

        [ConfigurationProperty("password")]
        public string Password
        {
            get { return (string)this["password"]; }
            set { this["password"] = value; }
        }

        [ConfigurationProperty("ownerid")]
        public Guid OwnerId
        {
            get { return (Guid)this["ownerid"]; }
            set { this["ownerid"] = value; }
        }

        [ConfigurationProperty("day")]
        public int Day
        {
            get { return (int)this["day"]; }
            set { this["day"] = value; }
        }

        public static void SaveUserSettings(UserSettings userInfo)
        {
            if (userInfo == null)
            {
                userInfo = new UserSettings();
            }
            //userInfo.Name = fontDialog.Font.Name;
            //userInfo.Size = fontDialog.Font.Size;
            //userInfo.Style = Convert.ToInt32(fontDialog.Font.Style);

            // Write the new configuration data to the XML file
            Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.Sections.Remove("UserSettings");
            config.Sections.Add("UserSettings", userInfo);
            config.Save();
        }

        public static UserSettings GetUserSettings()
        {
            return ConfigurationManager.GetSection("UserSettings") as UserSettings;
        }
    }
}
