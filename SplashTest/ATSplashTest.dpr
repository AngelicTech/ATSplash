program ATSplashTest;

uses
  Vcl.Forms,
  AT.SplashTest.Vcl.Forms.Main in 'Forms\AT.SplashTest.Vcl.Forms.Main.pas' {frmMain},
  AT.SplashSvr.IPCUtils in '..\SplashServer\Code Units\AT.SplashSvr.IPCUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
