﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration.Install;

namespace SetupClassLibrary
{
    [RunInstaller(true)]
    public partial class Installer1 : Installer
    {
        public Installer1()
        {
            InitializeComponent();
        }
    }
}