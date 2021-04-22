
namespace ATSplash
{
    partial class SplashPlugin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SplashPlugin));
            this.pnlClient = new DevExpress.XtraEditors.PanelControl();
            this.pbSplash = new DevExpress.XtraEditors.MarqueeProgressBarControl();
            this.lblFullVersion = new DevExpress.XtraEditors.LabelControl();
            this.imgLogo = new DevExpress.XtraEditors.SvgImageBox();
            this.lblCopyright = new DevExpress.XtraEditors.LabelControl();
            this.lblStartMessage = new DevExpress.XtraEditors.LabelControl();
            this.lblAppVersion = new DevExpress.XtraEditors.LabelControl();
            this.lblAppName = new DevExpress.XtraEditors.LabelControl();
            ((System.ComponentModel.ISupportInitialize)(this.pnlClient)).BeginInit();
            this.pnlClient.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbSplash.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgLogo)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlClient
            // 
            this.pnlClient.Controls.Add(this.pbSplash);
            this.pnlClient.Controls.Add(this.lblFullVersion);
            this.pnlClient.Controls.Add(this.imgLogo);
            this.pnlClient.Controls.Add(this.lblCopyright);
            this.pnlClient.Controls.Add(this.lblStartMessage);
            this.pnlClient.Controls.Add(this.lblAppVersion);
            this.pnlClient.Controls.Add(this.lblAppName);
            this.pnlClient.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlClient.Location = new System.Drawing.Point(0, 0);
            this.pnlClient.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.pnlClient.Name = "pnlClient";
            this.pnlClient.Size = new System.Drawing.Size(533, 390);
            this.pnlClient.TabIndex = 7;
            // 
            // pbSplash
            // 
            this.pbSplash.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pbSplash.EditValue = 0;
            this.pbSplash.Location = new System.Drawing.Point(21, 258);
            this.pbSplash.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.pbSplash.Name = "pbSplash";
            this.pbSplash.Properties.MarqueeAnimationSpeed = 20;
            this.pbSplash.Size = new System.Drawing.Size(491, 18);
            this.pbSplash.TabIndex = 10;
            // 
            // lblFullVersion
            // 
            this.lblFullVersion.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblFullVersion.Location = new System.Drawing.Point(2, 336);
            this.lblFullVersion.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.lblFullVersion.Name = "lblFullVersion";
            this.lblFullVersion.Padding = new System.Windows.Forms.Padding(21, 0, 11, 5);
            this.lblFullVersion.Size = new System.Drawing.Size(83, 18);
            this.lblFullVersion.TabIndex = 9;
            this.lblFullVersion.Text = "FullVersion";
            // 
            // imgLogo
            // 
            this.imgLogo.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.imgLogo.Location = new System.Drawing.Point(305, 288);
            this.imgLogo.Margin = new System.Windows.Forms.Padding(5, 5, 5, 5);
            this.imgLogo.Name = "imgLogo";
            this.imgLogo.Padding = new System.Windows.Forms.Padding(11, 10, 11, 10);
            this.imgLogo.Size = new System.Drawing.Size(229, 102);
            this.imgLogo.SizeMode = DevExpress.XtraEditors.SvgImageSizeMode.Zoom;
            this.imgLogo.SvgImage = ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("imgLogo.SvgImage")));
            this.imgLogo.TabIndex = 8;
            this.imgLogo.Text = "svgImageBox1";
            // 
            // lblCopyright
            // 
            this.lblCopyright.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblCopyright.Location = new System.Drawing.Point(2, 354);
            this.lblCopyright.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.lblCopyright.Name = "lblCopyright";
            this.lblCopyright.Padding = new System.Windows.Forms.Padding(21, 0, 11, 21);
            this.lblCopyright.Size = new System.Drawing.Size(79, 34);
            this.lblCopyright.TabIndex = 7;
            this.lblCopyright.Text = "Copyright";
            // 
            // lblStartMessage
            // 
            this.lblStartMessage.Appearance.Font = new System.Drawing.Font("Tahoma", 12F);
            this.lblStartMessage.Appearance.Options.UseFont = true;
            this.lblStartMessage.Dock = System.Windows.Forms.DockStyle.Top;
            this.lblStartMessage.Location = new System.Drawing.Point(2, 189);
            this.lblStartMessage.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.lblStartMessage.Name = "lblStartMessage";
            this.lblStartMessage.Padding = new System.Windows.Forms.Padding(21, 32, 11, 5);
            this.lblStartMessage.Size = new System.Drawing.Size(124, 56);
            this.lblStartMessage.TabIndex = 6;
            this.lblStartMessage.Text = "StartMessage";
            // 
            // lblAppVersion
            // 
            this.lblAppVersion.Appearance.Font = new System.Drawing.Font("Tahoma", 28F, System.Drawing.FontStyle.Bold);
            this.lblAppVersion.Appearance.Options.UseFont = true;
            this.lblAppVersion.Appearance.Options.UseTextOptions = true;
            this.lblAppVersion.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            this.lblAppVersion.AutoSizeMode = DevExpress.XtraEditors.LabelAutoSizeMode.Vertical;
            this.lblAppVersion.Dock = System.Windows.Forms.DockStyle.Top;
            this.lblAppVersion.Location = new System.Drawing.Point(2, 97);
            this.lblAppVersion.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.lblAppVersion.Name = "lblAppVersion";
            this.lblAppVersion.Padding = new System.Windows.Forms.Padding(21, 5, 21, 42);
            this.lblAppVersion.Size = new System.Drawing.Size(529, 92);
            this.lblAppVersion.TabIndex = 5;
            this.lblAppVersion.Text = "AppVersion";
            // 
            // lblAppName
            // 
            this.lblAppName.Appearance.Font = new System.Drawing.Font("Tahoma", 40F, System.Drawing.FontStyle.Bold);
            this.lblAppName.Appearance.Options.UseFont = true;
            this.lblAppName.Appearance.Options.UseTextOptions = true;
            this.lblAppName.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            this.lblAppName.AutoSizeMode = DevExpress.XtraEditors.LabelAutoSizeMode.Vertical;
            this.lblAppName.Dock = System.Windows.Forms.DockStyle.Top;
            this.lblAppName.Location = new System.Drawing.Point(2, 2);
            this.lblAppName.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.lblAppName.Name = "lblAppName";
            this.lblAppName.Padding = new System.Windows.Forms.Padding(21, 31, 21, 0);
            this.lblAppName.Size = new System.Drawing.Size(529, 95);
            this.lblAppName.TabIndex = 4;
            this.lblAppName.Text = "AppName";
            // 
            // SplashPlugin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.Controls.Add(this.pnlClient);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "SplashPlugin";
            this.Size = new System.Drawing.Size(533, 390);
            this.Toolbars.Clear();
            ((System.ComponentModel.ISupportInitialize)(this.pnlClient)).EndInit();
            this.pnlClient.ResumeLayout(false);
            this.pnlClient.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbSplash.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imgLogo)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraEditors.PanelControl pnlClient;
        private DevExpress.XtraEditors.MarqueeProgressBarControl pbSplash;
        private DevExpress.XtraEditors.LabelControl lblFullVersion;
        private DevExpress.XtraEditors.SvgImageBox imgLogo;
        private DevExpress.XtraEditors.LabelControl lblCopyright;
        private DevExpress.XtraEditors.LabelControl lblStartMessage;
        private DevExpress.XtraEditors.LabelControl lblAppVersion;
        private DevExpress.XtraEditors.LabelControl lblAppName;
    }
}