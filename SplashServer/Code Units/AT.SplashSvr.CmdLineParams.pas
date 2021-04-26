unit AT.SplashSvr.CmdLineParams;

interface

type
  TCmdLineParams = class( TObject )
  strict private
  class var
    FAppID: string;
    FAppName: string;
    FAppVersion: string;
    FCopyright: string;
    FFullVersion: string;
    FHostID: Integer;
    FSkinName: string;
    FSkinPalette: string;
  public
    class property AppID: string
      read FAppID
      write FAppID;
    class property AppName: string
      read FAppName
      write FAppName;
    class property AppVersion: string
      read FAppVersion
      write FAppVersion;
    class property Copyright: string
      read FCopyright
      write FCopyright;
    class property FullVersion: string
      read FFullVersion
      write FFullVersion;
    class property HostID: Integer
      read FHostID
      write FHostID;
    class property SkinName: string
      read FSkinName
      write FSkinName;
    class property SkinPalette: string
      read FSkinPalette
      write FSkinPalette;
  end;

implementation

uses
  VSoft.CommandLine.Options;

procedure ConfigureParams;
begin

  TOptionsRegistry.NameValueSeparator := ':';

  var AParam := TOptionsRegistry.RegisterOption< string >( 'AppID',
    'AID',
    'A unique string to use to communicate with the splash screen.',
    procedure( const Value: string )
    begin
      TCmdLineParams.AppID := Value;
    end );
  AParam.Required := True;

  AParam := TOptionsRegistry.RegisterOption< string >( 'AppName',
    'AN', 'The application name to display in the splash screen.',
    procedure( const Value: string )
    begin
      TCmdLineParams.AppName := Value;
    end );
  AParam.Required := True;

  AParam := TOptionsRegistry.RegisterOption< string >( 'AppVersion',
    'AV', 'The application version to display in the splash screen.',
    procedure( const Value: string )
    begin
      TCmdLineParams.AppVersion := Value;
    end );
  AParam.Required := True;

  AParam := TOptionsRegistry.RegisterOption< string >( 'Copyright',
    'CR', 'The copyright to display in the splash screen.',
    procedure( const Value: string )
    begin
      TCmdLineParams.Copyright := Value;
    end );
  AParam.Required := True;

  AParam := TOptionsRegistry.RegisterOption< string >( 'FullVersion',
    'FV', 'The full version information to display in the splash screen.',
    procedure( const Value: string )
    begin
      TCmdLineParams.FullVersion := Value;
    end );
  AParam.Required := True;

  AParam := TOptionsRegistry.RegisterOption< Integer >( 'HostID',
    'HID', 'A handle to a window in the host application.',
    procedure( const Value: Integer )
    begin
      TCmdLineParams.HostID := Value;
    end );
  AParam.Required := True;

  AParam := TOptionsRegistry.RegisterOption< string >( 'SkinName',
    'SN', 'The DevExpress skin name to use for the splash screen.',
    procedure( const Value: string )
    begin
      TCmdLineParams.SkinName := Value;
    end );
  AParam.Required := False;

  AParam := TOptionsRegistry.RegisterOption< string >( 'SkinPalette',
    'SP', 'The DevExpress skin palette to use for the splash screen.',
    procedure( const Value: string )
    begin
      TCmdLineParams.SkinPalette := Value;
    end );
  AParam.Required := False;

end;

initialization

  ConfigureParams;

end.
