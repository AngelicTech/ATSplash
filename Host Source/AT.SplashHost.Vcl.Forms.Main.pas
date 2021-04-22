unit AT.SplashHost.Vcl.Forms.Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uHYModuleManager, uHYIntf, uHYBaseModuleManager,
  Vcl.ExtCtrls, dxSkinsCore, dxSkinBasic, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringtime,
  dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxCore, cxClasses, cxLookAndFeels, dxSkinsForm;

type
  TMainForm = class(TForm)
    HYModuleManager1: THYModuleManager;
    pnl1: TPanel;
    sknctl1: TdxSkinController;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  strict private
    FPlugin: IHYVisualPlugin;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses AT_SplashHost_Interfaces;

procedure TMainForm.FormDestroy(Sender: TObject);
begin

  HYModuleManager1.ReleaseInstance(FPlugin);
  HYModuleManager1.UnloadModules;

end;

procedure TMainForm.FormShow(Sender: TObject);
begin

  Self.OnShow := NIL;

  HYModuleManager1.LoadModule('ATSplash.dll');
  HYModuleManager1.CreateVisualPlugin('ATSplashPlugin', FPlugin, pnl1);

  var AIntf: IATSplash;

  if (NOT Supports(FPlugin, IATSplash, AIntf)) then
    exit;

  AIntf.AppName := 'Hydra Splash Demo';
  AIntf.AppVersion := '2021.04';
  AIntf.Copyright := 'Copyright © 2021 Angelic Technology LLC.';
  AIntf.FullVersion := '2021.04.01.0';
  AIntf.StartMessage := 'Starting...';

  var ASkin := 'Summer 2008'; //sknctl1.SkinName;
  var APalette := sknctl1.SkinPaletteName;

  AIntf.SetSkin(ASkin, APalette);

end;

end.
