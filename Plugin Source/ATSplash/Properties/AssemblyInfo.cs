#region Using directives

using RemObjects.Hydra;
using System.Globalization;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

#endregion

// General Information about an assembly is controlled through the following 
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
[assembly: AssemblyTitle("ATSplash")]
[assembly: AssemblyDescription("AT Splash Plugin")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Angelic Technology LLC")]
[assembly: AssemblyProduct("ATSplash")]
[assembly: AssemblyCopyright("Copyright @ 2021")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]


// The Hydra PluginModule attribute can specify a name and version for
// the plugin to be shows in host applications
[assembly: PluginModule(Name = "ATSplash", Version = "1.0.0.1")]


// Setting ComVisible to false makes the types in this assembly not visible 
// to COM components.  If you need to access a type in this assembly from 
// COM, set the ComVisible attribute to true on that type.
[assembly: ComVisible(true)]

//In order to begin building localizable applications, set 
//<UICulture>CultureYouAreCodingWith</UICulture> in your .csproj file
//inside a <PropertyGroup>.  For example, if you are using US English
//in your source files, set the <UICulture> to en-US.  Then uncomment
//the NeutralResourceLanguage attribute below.  Update the "en-US" in
//the line below to match the UICulture setting in the project file.

//[assembly: NeutralResourcesLanguage("en-US", UltimateResourceFallbackLocation.Satellite)]

// The following GUID is for the ID of the typelib if this project is exposed to COM
[assembly: Guid("6ced09f8-4869-473a-9859-e2b2dd26aebe")]

// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version 
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Revision and Build Numbers 
// by using the '*' as shown below:
[assembly: AssemblyVersion("1.0.*")]
