program SplashHost;

uses
  Forms,
  AT.SplashHost.Vcl.Forms.Main in 'AT.SplashHost.Vcl.Forms.Main.pas' {MainForm},
  AT_SplashHost_Interfaces in 'AT_SplashHost_Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
