unit AT.SplashSvr.Vcl.DM.Theme;

interface

uses
  System.SysUtils, System.Classes,
  cxClasses, cxLookAndFeels,
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
  dxCore;

type
  TdmMain = class( TDataModule )
    sknctlSplash: TdxSkinController;
  public
    constructor Create( AOwner: TComponent ); override;
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  System.StrUtils, System.Rtti,
  Vcl.Dialogs, Vcl.Forms,
  AT.SplashSvr.CmdLineParams, AT.SplashSvr.Vcl.Forms.Main, AT.Rtti;

{$R *.dfm}

constructor TdmMain.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );

  var ASkin := TCmdLineParams.SkinName.Trim;
  var ANative := ( ASkin.IsEmpty );

  sknctlSplash.NativeStyle := ANative;
  sknctlSplash.UseSkins := ( NOT ANative );

  if ( ANative ) then
    exit;

  sknctlSplash.SkinName := ASkin;

  var APalette := TCmdLineParams.SkinPalette.Trim;

  if ( APalette.IsEmpty ) then
    APalette := 'Default';

  sknctlSplash.SkinPaletteName := APalette;

end;

end.
