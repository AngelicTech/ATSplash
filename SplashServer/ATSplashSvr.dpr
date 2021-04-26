program ATSplashSvr;

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  VSoft.CommandLine.OptionDef,
  VSoft.CommandLine.Options,
  VSoft.CommandLine.Parser,
  VSoft.CommandLine.Utils,
  AT.Automate,
  AT.SplashSvr.Vcl.Forms.Main in 'Forms\AT.SplashSvr.Vcl.Forms.Main.pas' {frmSplashMain},
  AT.SplashSvr.CmdLineParams in 'Code Units\AT.SplashSvr.CmdLineParams.pas',
  AT.SplashSvr.Vcl.DM.Theme in 'Data Modules\AT.SplashSvr.Vcl.DM.Theme.pas' {dmMain: TDataModule},
  AT.SplashSvr.IPCUtils in 'Code Units\AT.SplashSvr.IPCUtils.pas';

{$R *.res}

begin

  var AResult := TOptionsRegistry.Parse;

  if (AResult.HasErrors) then
    begin
      var AMsg := TStringList.Create;
      var AMsgAF := TATAutoFree.Create(AMsg);

      AMsg.Add('Invalid Command Line');
      AMsg.Add(EmptyStr);
      AMsg.Add(AResult.ErrorText);

      ShowMessage(AMsg.Text);

      exit;

    end;

  InitWindowMessages(TCmdLineParams.AppID);

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmSplashMain, frmSplashMain);
  Application.Run;

end.
