unit AT.SplashSvr.Vcl.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxGDIPlusClasses, dxActivityIndicator,
  AT.SplashSvr.IPCUtils;

type
  TfrmSplashMain = class( TForm )
    actindStarting: TdxActivityIndicator;
    imgLogo: TImage;
    lblAppName: TcxLabel;
    lblAppVersion: TcxLabel;
    lblCopyright: TcxLabel;
    lblFullVersion: TcxLabel;
    lblStartMessage: TcxLabel;
    pnlClient: TRelativePanel;
    procedure FormCloseQuery( Sender: TObject;
      var CanClose: Boolean );
    procedure FormKeyUp( Sender: TObject; var Key: Word;
      Shift: TShiftState );
  strict private
    FForceClose: Boolean;
    FMemMapBuffer: PMemMapBuffer;
    FMemMapName: string;
    FMemMap: THandle;
  strict protected
    function GetAppName: string;
    function GetAppVersion: string;
    function GetCopyright: string;
    function GetFullVersion: string;
    function GetStartMessage: string;
    procedure SetAppName( const Value: string );
    procedure SetAppVersion( const Value: string );
    procedure SetCopyright( const Value: string );
    procedure SetFullVersion( const Value: string );
    procedure SetStartMessage( const Value: string );
  protected
    procedure CreateParams( var Params: TCreateParams ); override;
  public
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
    procedure ForceClose;
    procedure WndProc( var AMsg: TMessage ); override;
    property AppName: string
      read   GetAppName
      write  SetAppName;
    property AppVersion: string
      read   GetAppVersion
      write  SetAppVersion;
    property Copyright: string
      read   GetCopyright
      write  SetCopyright;
    property FullVersion: string
      read   GetFullVersion
      write  SetFullVersion;
    property StartMessage: string
      read   GetStartMessage
      write  SetStartMessage;
  end;

var
  frmSplashMain: TfrmSplashMain;

implementation

{$R *.dfm}

uses
  System.StrUtils,
  AT.SplashSvr.CmdLineParams;

constructor TfrmSplashMain.Create( AOwner: TComponent );
begin

  inherited Create( AOwner );

  FForceClose := False;

  AppName := TCmdLineParams.AppName;
  AppVersion := TCmdLineParams.AppVersion;
  Copyright := TCmdLineParams.Copyright;
  FullVersion := TCmdLineParams.FullVersion;

  StartMessage := 'Starting...';

  var AHostID := HWND( TCmdLineParams.HostID );
  var AHandle := NativeUInt( Self.Handle );

  var AAppID := TCmdLineParams.AppID;
  FMemMapName := Format( cMemMapNameFmt, [ AAppID ] );

  FMemMap := CreateFileMapping(
      INVALID_HANDLE_VALUE,
      NIL,
      PAGE_READWRITE,
      0,
      SizeOf( TMemMapBuffer ),
      PChar( FMemMapName ) );

  FMemMapBuffer := MapViewOfFile(
      FMemMap,
      FILE_MAP_ALL_ACCESS,
      0,
      0,
      SizeOf( TMemMapBuffer ) );

  FillChar( FMemMapBuffer^, SizeOf( TMemMapBuffer ), 0 );

  SendMessage( AHostID, G_WM_SetSplashFormHandle, AHandle, 0 );

end;

destructor TfrmSplashMain.Destroy;
begin

  if ( Assigned( FMemMapBuffer ) ) then
    begin

      UnmapViewOfFile( FMemMapBuffer );

      FMemMapBuffer := NIL;

    end;

  if ( FMemMap <> 0 ) then
    begin

      CloseHandle( FMemMap );

      FMemMap := 0;

    end;

  inherited Destroy;

end;

procedure TfrmSplashMain.CreateParams( var Params: TCreateParams );
begin

  inherited CreateParams( Params );

  Params.ExStyle := ( Params.ExStyle AND NOT WS_EX_APPWINDOW );
  Params.WndParent := Application.Handle;

end;

procedure TfrmSplashMain.ForceClose;
begin

  FForceClose := True;

  Close;

end;

procedure TfrmSplashMain.FormCloseQuery( Sender: TObject;
  var CanClose: Boolean );
begin

  CanClose := FForceClose;

end;

procedure TfrmSplashMain.FormKeyUp( Sender: TObject; var Key: Word;
  Shift: TShiftState );
begin

  // Only have force close functionality via keyboard in
  // debug builds...

{$IF Defined(DEBUG)}
  // Shift+Ctrl+Alt+F4 will force close a debug build...
  if ( ( Shift = [ ssShift, ssCtrl, ssAlt ] ) AND ( Key = VK_F4 ) )
  then
    ForceClose;

{$ENDIF}

end;

function TfrmSplashMain.GetAppName: string;
begin

  Result := lblAppName.Caption;

end;

function TfrmSplashMain.GetAppVersion: string;
begin

  Result := lblAppVersion.Caption;

end;

function TfrmSplashMain.GetCopyright: string;
begin

  Result := lblCopyright.Caption;

end;

function TfrmSplashMain.GetFullVersion: string;
begin

  Result := lblFullVersion.Caption;

end;

function TfrmSplashMain.GetStartMessage: string;
begin

  Result := lblStartMessage.Caption;

end;

procedure TfrmSplashMain.SetAppName( const Value: string );
begin

  lblAppName.Caption := Value;

end;

procedure TfrmSplashMain.SetAppVersion( const Value: string );
begin

  lblAppVersion.Caption := Value;

end;

procedure TfrmSplashMain.SetCopyright( const Value: string );
begin

  var
  ACaption := Value;

  if ( ContainsText( ACaption, '&copy;' ) ) then
    ACaption := ReplaceStr( ACaption, '&copy;', '©' );

  lblCopyright.Caption := ACaption;

end;

procedure TfrmSplashMain.SetFullVersion( const Value: string );
begin

  lblFullVersion.Caption := Value;

end;

procedure TfrmSplashMain.SetStartMessage( const Value: string );
begin

  lblStartMessage.Caption := Value;

end;

procedure TfrmSplashMain.WndProc( var AMsg: TMessage );
begin

  if ( AMsg.Msg = G_WM_SplashClose ) then
    ForceClose

  else if ( AMsg.Msg = G_WM_SplashHide ) then
    Hide

  else if ( AMsg.Msg = G_WM_SplashSetStartMsg ) then
    begin

      if ( NOT Assigned( FMemMapBuffer ) ) then
        exit;

      var AValue := string( FMemMapBuffer.Value );

      SetStartMessage( AValue );

    end

  else if ( AMsg.Msg = G_WM_SplashShow ) then
    Show

  else
    inherited WndProc( AMsg );

end;

end.
