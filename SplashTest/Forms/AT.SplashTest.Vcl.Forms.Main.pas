unit AT.SplashTest.Vcl.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.ActnList, Vcl.StdCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxButtons, cxClasses,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsForm,
  dxCore,
  AT.SplashSvr.IPCUtils,
  DosCommand;

type
  TfrmMain = class(TForm)
    sknctlMain: TdxSkinController;
    btnRunServer: TcxButton;
    btnShowSplash: TcxButton;
    btnHideSplash: TcxButton;
    btnCloseSplash: TcxButton;
    txtSplashMessage: TcxButtonEdit;
    btnStatus: TcxButton;
    alstMain: TActionList;
    actStatus: TAction;
    actSetStartMsg: TAction;
    doscmdSplash: TDosCommand;
    procedure actSetStartMsgExecute(Sender: TObject);
    procedure UpdateStatusAction(Sender: TObject);
    procedure btnRunServerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnShowSplashClick(Sender: TObject);
    procedure btnHideSplashClick(Sender: TObject);
    procedure btnCloseSplashClick(Sender: TObject);
  strict private
    FMemMapBuffer: PMemMapBuffer;
    FMemMapName: string;
    FMemMap: THandle;
    FSplashHandle: HWND;
  public
    procedure WndProc(var AMsg: TMessage); override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

var GAppID: TGUID;


procedure TfrmMain.actSetStartMsgExecute(Sender: TObject);
begin

  if (NOT doscmdSplash.IsRunning) then
    exit;

  var AAppID := GAppID.ToString;
  FMemMapName := Format(cMemMapNameFmt, [AAppID]);

  FMemMap := OpenFileMapping(
      FILE_MAP_ALL_ACCESS,
      False,
      PChar(FMemMapName));

  try
    FMemMapBuffer := MapViewOfFile(
        FMemMap,
        FILE_MAP_ALL_ACCESS,
        0,
        0,
        SizeOf(TMemMapBuffer));

    try
      var AValue: string := txtSplashMessage.Text;

      StrPLCopy(FMemMapBuffer.Value, AValue, High(FMemMapBuffer.Value));

      SendMessage(FSplashHandle, G_WM_SplashSetStartMsg, 0, 0);
    finally

      if (Assigned(FMemMapBuffer)) then
        begin

          UnmapViewOfFile(FMemMapBuffer);

          FMemMapBuffer := NIL;

        end;

    end;

  finally


    if (FMemMap <> 0) then
      begin

        CloseHandle(FMemMap);

        FMemMap := 0;

      end;

  end;

end;

procedure TfrmMain.btnCloseSplashClick(Sender: TObject);
begin

  if (NOT doscmdSplash.IsRunning) then
    exit;

  SendMessage(FSplashHandle, G_WM_SplashClose, 0, 0);

end;

procedure TfrmMain.btnHideSplashClick(Sender: TObject);
begin

  if (NOT doscmdSplash.IsRunning) then
    exit;

  SendMessage(FSplashHandle, G_WM_SplashHide, 0, 0);

end;

procedure TfrmMain.btnRunServerClick(Sender: TObject);
begin

  if (doscmdSplash.IsRunning) then
    exit;

  var AAppID := GAppID.ToString;
  var AAppName := 'My Application';
  var AAppVersion := '2021.04';
  var ACopyright := 'Copyright &copy; 2021 Angelic Technology LLC';
  var AFullVersion := '2021.04.24.0';
  var AHostID := Integer(Handle);

  const AFmt = 'ATSplashSvr.exe /AID:"%s" /HID:%d /AN:"%s" /AV:"%s" /CR:"%s" /FV:"%s"';
  var ACmdLn := Format( AFmt, [
      AAppID, AHostID, AAppName, AAppVersion, ACopyright,
      AFullVersion]);


  if ( (NOT sknctlMain.NativeStyle) AND (sknctlMain.UseSkins) )then
    begin

      var ASkinName := sknctlMain.SkinName;
      var APaletteName := sknctlMain.SkinPaletteName;

      ACmdLn := Format('%s /SN:"%s" /SP:"%s"', [ACmdLn, ASkinName,
          APaletteName]);

    end;

  doscmdSplash.CommandLine := ACmdLn;

  doscmdSplash.Execute;

end;

procedure TfrmMain.btnShowSplashClick(Sender: TObject);
begin

  if (NOT doscmdSplash.IsRunning) then
    exit;

  SendMessage(FSplashHandle, G_WM_SplashShow, 0, 0);

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  btnCloseSplash.Click;

  if (NOT doscmdSplash.IsRunning) then
    begin

      doscmdSplash.Stop;

    end;

end;

procedure TfrmMain.UpdateStatusAction(Sender: TObject);
begin

  (Sender AS TAction).Enabled := False;

  var ACaption := 'Splash Server NOT Running';

  if (doscmdSplash.IsRunning) then
    ACaption := 'Splash Server IS Running';

  (Sender AS TAction).Caption := ACaption

end;


procedure TfrmMain.WndProc(var AMsg: TMessage);
begin

  if (AMsg.Msg = G_WM_SetSplashFormHandle) then
    begin
      FSplashHandle := HWND(AMsg.WParam);
    end
  else
    inherited WndProc(AMsg);

end;

initialization

  GAppID := TGUID.NewGuid;

  InitWindowMessages(GAppID.ToString);

end.
