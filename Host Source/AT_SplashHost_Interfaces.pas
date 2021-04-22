unit AT_SplashHost_Interfaces;

interface

uses
  uHYCrossPlatformInterfaces;

type
  IATSplash = interface( IHYCrossPlatformInterface )
    [ '{E2E271DD-B4B4-4437-9F76-95FC88D27C83}' ]
    function GetAppName: WideString; safecall;
    function GetAppVersion: WideString; safecall;
    function GetCopyright: WideString; safecall;
    function GetFullVersion: WideString; safecall;
    function GetStartMessage: WideString; safecall;
    procedure SetAppName(const Value: WideString); safecall;
    procedure SetAppVersion(const Value: WideString); safecall;
    procedure SetCopyright(const Value: WideString); safecall;
    procedure SetFullVersion(const Value: WideString); safecall;
    procedure SetSkin(const ASkinName, APaletteName: WideString); safecall;
    procedure SetStartMessage(const Value: WideString); safecall;
    property AppName: WideString read GetAppName write SetAppName;
    property AppVersion: WideString read GetAppVersion write SetAppVersion;
    property Copyright: WideString read GetCopyright write SetCopyright;
    property FullVersion: WideString read GetFullVersion write SetFullVersion;
    property StartMessage: WideString read GetStartMessage write SetStartMessage;
  end;

implementation

end.
