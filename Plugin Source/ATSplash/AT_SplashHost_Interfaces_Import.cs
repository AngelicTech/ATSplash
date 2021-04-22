// Imported cross-patform Hydra plugin interfaces


namespace ATSplash
{
	[System.Runtime.InteropServices.GuidAttribute("e2e271dd-b4b4-4437-9f76-95fc88d27c83")]
	public interface IATSplash : RemObjects.Hydra.CrossPlatform.IHYCrossPlatformInterface
	{
		string GetAppName();

		string GetAppVersion();

		string GetCopyright();

		string GetFullVersion();

		string GetStartMessage();

		void SetAppName(string Value);

		void SetAppVersion(string Value);

		void SetCopyright(string Value);

		void SetFullVersion(string Value);

		void SetSkin(string ASkinName, string APaletteName);

		void SetStartMessage(string Value);
	}

}
