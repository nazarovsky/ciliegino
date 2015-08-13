program Ciliegino;

uses
  Forms,
  uCiliegino in 'uCiliegino.pas' {Form1},
  uSettings in 'uSettings.pas' {SettingsForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ciliegino - a minimalistic pomodoro timer';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.Run;
end.
