using DevExpress.LookAndFeel;
using RemObjects.Hydra;

namespace ATSplash
{
    [Plugin(Name = "ATSplashPlugin"), VisualPlugin]
    public partial class SplashPlugin : VisualPlugin, IATSplash
    {
        public SplashPlugin()
        {
            InitializeComponent();

            DevExpress.UserSkins.BonusSkins.Register();

            SetAppName("");
            SetAppVersion("");
            SetCopyright("");
            SetFullVersion("");
            SetStartMessage("");

        }

        public string GetAppName()
        {
            return lblAppName.Text;
        }

        public string GetAppVersion()
        {
            return lblAppVersion.Text;
        }

        public string GetCopyright()
        {
            return lblCopyright.Text;
        }

        public string GetFullVersion()
        {
            return lblFullVersion.Text;
        }

        public string GetStartMessage()
        {
            return lblStartMessage.Text;
        }

        public void SetAppName(string Value)
        {
            lblAppName.Text = Value;
        }

        public void SetAppVersion(string Value)
        {
            lblAppVersion.Text = Value;
        }

        public void SetCopyright(string Value)
        {
            lblCopyright.Text = Value;
        }

        public void SetFullVersion(string Value)
        {
            lblFullVersion.Text = Value;
        }

        public void SetSkin(string ASkinName, string APaletteName)
        {
            UserLookAndFeel.Default.SetSkinStyle(ASkinName, APaletteName);
        }

        public void SetStartMessage(string Value)
        {
            lblStartMessage.Text = Value;
        }
    }
}