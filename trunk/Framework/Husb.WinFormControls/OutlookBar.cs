using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Drawing;

namespace Husb.WinFormControls
{
    internal enum ButtonState
    {
        Passive,
        Hovering,
        Selected
    }

    public enum Renderer
    {
        Outlook2003,
        Outlook2007,
        Custom
    }

    internal class BandTagInfo
    {
        public OutlookBar outlookBar;
        public int index;

        public BandTagInfo(OutlookBar ob, int index)
        {
            outlookBar = ob;
            this.index = index;
        }
    }

    public class OutlookBar : Panel
    {
        private int buttonHeight;
        private int selectedBand;
        private int selectedBandHeight;

        public int ButtonHeight
        {
            get
            {
                return buttonHeight;
            }

            set
            {
                buttonHeight = value;
                // do recalc layout for entire bar
            }
        }

        public int SelectedBand
        {
            get
            {
                return selectedBand;
            }
            set
            {
                SelectBand(value);
            }
        }

        public OutlookBar()
        {
            buttonHeight = 25;
            selectedBand = 0;
            selectedBandHeight = 0;
        }

        public void Initialize()
        {
            // parent must exist!
            Parent.SizeChanged += new EventHandler(SizeChangedEvent);
        }

        public void AddBand(string caption, ContentPanel content)
        {
            content.outlookBar = this;
            int index = Controls.Count;
            BandTagInfo bti = new BandTagInfo(this, index);
            BandPanel bandPanel = new BandPanel(caption, content, bti);
            //bandPanel.Dock = DockStyle.Top;
            Controls.Add(bandPanel);
            UpdateBarInfo();
            RecalcLayout(bandPanel, index);
        }

        public void SelectBand(int index)
        {
            selectedBand = index;
            RedrawBands();
        }

        private void RedrawBands()
        {
            for (int i = 0; i < Controls.Count; i++)
            {
                BandPanel bp = Controls[i] as BandPanel;
                RecalcLayout(bp, i);
            }
        }

        private void UpdateBarInfo()
        {
            selectedBandHeight = ClientRectangle.Height - (Controls.Count * buttonHeight);
        }

        private void RecalcLayout(BandPanel bandPanel, int index)
        {
            int vPos = (index <= selectedBand) ? buttonHeight * index : buttonHeight * index + selectedBandHeight;
            int height = selectedBand == index ? selectedBandHeight + buttonHeight : buttonHeight;

            // the band dimensions
            bandPanel.Location = new Point(0, vPos);
            bandPanel.Size = new Size(ClientRectangle.Width, height);

            // the contained button dimensions
            bandPanel.Controls[0].Location = new Point(0, 0);
            bandPanel.Controls[0].Size = new Size(ClientRectangle.Width, buttonHeight);

            // the contained content panel dimensions
            bandPanel.Controls[1].Location = new Point(0, buttonHeight);
            bandPanel.Controls[1].Size = new Size(ClientRectangle.Width - 2, height - 8);
        }

        private void SizeChangedEvent(object sender, EventArgs e)
        {
            Size = new Size(Size.Width, ((Control)sender).ClientRectangle.Size.Height);
            UpdateBarInfo();
            RedrawBands();
        }
    }

    internal class BandPanel : Panel
    {
        public BandPanel(string caption, ContentPanel content, BandTagInfo bti)
        {
            BandButton bandButton = new BandButton(caption, bti);
            bandButton.Dock = DockStyle.Top;
            Controls.Add(bandButton);
            Controls.Add(content);
        }
    }

    internal class BandButton : Button
    {
        private BandTagInfo bti;

        public BandButton(string caption, BandTagInfo bti)
        {
            Text = caption;
            FlatStyle = FlatStyle.Standard;
            Visible = true;
            this.bti = bti;
            this.BackColor = Color.FromArgb(130, 170, 225);
            Click += new EventHandler(SelectBand);
        }

        private void SelectBand(object sender, EventArgs e)
        {
            bti.outlookBar.SelectBand(bti.index);
        }

        protected override void OnMouseEnter(EventArgs e)
        {
            base.OnMouseEnter(e);
            Color color = this.BackColor;
            this.BackColor = Color.FromArgb(255, 226, 147);
        }

        protected override void OnMouseLeave(EventArgs e)
        {
            base.OnMouseLeave(e);

            //this.BackColor = System.Drawing.SystemColors.Control;
            this.BackColor = Color.FromArgb(130, 170, 225);
        }

        //public Renderer Renderer { get; set; }


        //#region GetButtonColor
        //private Color GetButtonColor(ButtonState buttonState, int colorIndex)
        //{
        //    Color GetButtonColor;
        //    switch (this.Renderer)
        //    {
        //        case Renderer.Outlook2003:
        //            switch (buttonState)
        //            {
        //                case ButtonState.Passive:
        //                    if (colorIndex == 0)
        //                    {
        //                        return Color.FromArgb(0xcb, 0xe1, 0xfc);
        //                    }
        //                    if (colorIndex != 1)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return Color.FromArgb(0x7d, 0xa6, 0xdf);

        //                case ButtonState.Hovering:
        //                    if (colorIndex == 0)
        //                    {
        //                        return Color.FromArgb(0xff, 0xff, 220);
        //                    }
        //                    if (colorIndex != 1)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return Color.FromArgb(0xf7, 0xc0, 0x5b);

        //                case ButtonState.Selected:
        //                    if (colorIndex == 0)
        //                    {
        //                        return Color.FromArgb(0xf7, 0xda, 0x7c);
        //                    }
        //                    if (colorIndex != 1)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return Color.FromArgb(0xe8, 0x7f, 8);

        //                case (ButtonState.Selected | ButtonState.Hovering):
        //                    if (colorIndex == 0)
        //                    {
        //                        return Color.FromArgb(0xe8, 0x7f, 8);
        //                    }
        //                    if (colorIndex != 1)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return Color.FromArgb(0xf7, 0xda, 0x7c);
        //            }
        //            return GetButtonColor;

        //        case Renderer.Outlook2007:
        //            switch (buttonState)
        //            {
        //                case ButtonState.Passive:
        //                    if (colorIndex == 0)
        //                    {
        //                        return Color.FromArgb(0xe3, 0xef, 0xff);
        //                    }
        //                    if (colorIndex == 1)
        //                    {
        //                        return Color.FromArgb(0xc4, 0xdd, 0xff);
        //                    }
        //                    if (colorIndex == 2)
        //                    {
        //                        return Color.FromArgb(0xad, 0xd1, 0xff);
        //                    }
        //                    if (colorIndex != 3)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return Color.FromArgb(0xc1, 0xdb, 0xff);

        //                case ButtonState.Hovering:
        //                    if (colorIndex == 0)
        //                    {
        //                        return Color.FromArgb(0xff, 0xfe, 0xe4);
        //                    }
        //                    if (colorIndex == 1)
        //                    {
        //                        return Color.FromArgb(0xff, 0xe8, 0xa6);
        //                    }
        //                    if (colorIndex == 2)
        //                    {
        //                        return Color.FromArgb(0xff, 0xd7, 0x67);
        //                    }
        //                    if (colorIndex != 3)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return Color.FromArgb(0xff, 230, 0x9f);

        //                case ButtonState.Selected:
        //                    if (colorIndex == 0)
        //                    {
        //                        return Color.FromArgb(0xff, 0xd9, 170);
        //                    }
        //                    if (colorIndex == 1)
        //                    {
        //                        return Color.FromArgb(0xff, 0xbb, 0x6d);
        //                    }
        //                    if (colorIndex == 2)
        //                    {
        //                        return Color.FromArgb(0xff, 0xab, 0x3f);
        //                    }
        //                    if (colorIndex != 3)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return Color.FromArgb(0xfe, 0xe1, 0x7b);

        //                case (ButtonState.Selected | ButtonState.Hovering):
        //                    if (colorIndex == 0)
        //                    {
        //                        return Color.FromArgb(0xff, 0xbd, 0x69);
        //                    }
        //                    if (colorIndex == 1)
        //                    {
        //                        return Color.FromArgb(0xff, 0xac, 0x42);
        //                    }
        //                    if (colorIndex == 2)
        //                    {
        //                        return Color.FromArgb(0xfb, 140, 60);
        //                    }
        //                    if (colorIndex != 3)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return Color.FromArgb(0xfe, 0xd3, 0x65);
        //            }
        //            return GetButtonColor;

        //        case Renderer.Custom:
        //            switch (buttonState)
        //            {
        //                case ButtonState.Passive:
        //                    if (colorIndex == 0)
        //                    {
        //                        return this.ButtonColorPassiveTop;
        //                    }
        //                    if (colorIndex == 1)
        //                    {
        //                        return this.ButtonColorPassiveBottom;
        //                    }
        //                    return GetButtonColor;

        //                case ButtonState.Hovering:
        //                    if (colorIndex == 0)
        //                    {
        //                        return this.ButtonColorHoveringTop;
        //                    }
        //                    if (colorIndex != 1)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return this.ButtonColorHoveringBottom;

        //                case ButtonState.Selected:
        //                    if (colorIndex == 0)
        //                    {
        //                        return this.ButtonColorSelectedTop;
        //                    }
        //                    if (colorIndex != 1)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return this.ButtonColorSelectedBottom;

        //                case (ButtonState.Selected | ButtonState.Hovering):
        //                    if (colorIndex == 0)
        //                    {
        //                        return this.ButtonColorSelectedAndHoveringTop;
        //                    }
        //                    if (colorIndex != 1)
        //                    {
        //                        return GetButtonColor;
        //                    }
        //                    return this.ButtonColorSelectedAndHoveringBottom;
        //            }
        //            return GetButtonColor;
        //    }
        //    return GetButtonColor;
        //}
        //#endregion

    }

    public abstract class ContentPanel : Panel
    {
        public OutlookBar outlookBar;

        public ContentPanel()
        {
            // initial state
            Visible = true;
        }
    }

    public class IconPanel : ContentPanel
    {
        protected int iconSpacing;
        //protected int margin;

        public int IconSpacing
        {
            get
            {
                return iconSpacing;
            }
        }

        //public new int Margin
        //{
        //    get
        //    {
        //        return margin;
        //    }
        //}

        public IconPanel()
        {
            this.Margin = new Padding(10, 10, 10, 10);
            //margin = 10;
            iconSpacing = 32 + 15 + 10;	// icon height + text height + margin
            //BackColor = Color.LightBlue;
            //BackColor = Color.FromArgb(224, 236, 249);
            BackColor = Color.FromArgb(193, 217, 243);
            AutoScroll = true;
            //this.Dock = DockStyle.Top;
        }

        public void AddIcon(string caption, Image image, EventHandler onClickEvent)
        {
            if (image == null)
            {
                image = new Bitmap(typeof(BindingNavigator), "BindingNavigator.MoveFirst.bmp");
                ((Bitmap)image).MakeTransparent(Color.Magenta);

                //Assembly assembly = Assembly.GetAssembly(typeof(Form));
                //Bitmap bitmap1 = new Bitmap(assembly.GetManifestResourceStream("System.Windows.Forms.cut.bmp"));
                //Bitmap bitmap2 = new Bitmap(assembly.GetManifestResourceStream("System.Windows.Forms.copy.bmp"));
                //Bitmap bitmap3 = new Bitmap(assembly.GetManifestResourceStream("System.Windows.Forms.paste.bmp"));
                //Bitmap bitmap4 = new Bitmap(assembly.GetManifestResourceStream("System.Windows.Forms.delete.bmp"));
                //bitmap1.MakeTransparent(Color.Fuchsia);
                //bitmap2.MakeTransparent(Color.Fuchsia);
                //bitmap3.MakeTransparent(Color.Fuchsia);
                //bitmap4.MakeTransparent(Color.Fuchsia);

            }
            int index = Controls.Count / 2;	// two entries per icon
            PanelIcon panelIcon = new PanelIcon(this, image, index, onClickEvent);
            Controls.Add(panelIcon);

            Label label = new Label();
            label.Text = caption;
            label.Visible = true;
            label.Location = new Point(0, Margin.Top + image.Size.Height + index * iconSpacing);
            label.Size = new Size(Size.Width, 15);
            label.TextAlign = ContentAlignment.TopCenter;
            if (onClickEvent != null)
            {
                label.Click += onClickEvent;
            }
            label.Tag = panelIcon;
            Controls.Add(label);
        }
    }

    public class PanelIcon : PictureBox
    {
        public int index;
        public IconPanel iconPanel;

        private Color bckgColor;
        private bool mouseEnter;

        public int Index
        {
            get
            {
                return index;
            }
        }

        public PanelIcon(IconPanel parent, Image image, int index, EventHandler onClickEvent)
        {
            this.index = index;
            this.iconPanel = parent;
            Image = image;
            Visible = true;
            Location = new Point(iconPanel.outlookBar.Size.Width / 2 - image.Size.Width / 2,
                            iconPanel.Margin.Top + index * iconPanel.IconSpacing);
            Size = image.Size;
            Click += onClickEvent;
            Tag = this;

            MouseEnter += new EventHandler(OnMouseEnter);
            MouseLeave += new EventHandler(OnMouseLeave);
            MouseMove += new MouseEventHandler(OnMouseMove);

            bckgColor = iconPanel.BackColor;
            mouseEnter = false;
        }

        private void OnMouseMove(object sender, MouseEventArgs args)
        {
            if ((args.X < Size.Width - 2) &&
                (args.Y < Size.Width - 2) &&
                (!mouseEnter))
            {
                //BackColor = Color.LightCyan;
                BackColor = Color.FromArgb(239, 245, 251);
                BorderStyle = BorderStyle.FixedSingle;
                Location = Location - new Size(1, 1);
                mouseEnter = true;
            }
        }

        private void OnMouseEnter(object sender, EventArgs e)
        {
        }

        private void OnMouseLeave(object sender, EventArgs e)
        {
            if (mouseEnter)
            {
                BackColor = bckgColor;
                BorderStyle = BorderStyle.None;
                Location = Location + new Size(1, 1);
                mouseEnter = false;
            }
        }
    }
}
