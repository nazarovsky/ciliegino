unit uSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, ComCtrls;

type
  TSettingsForm = class(TForm)
    WTEdit: TSpinEdit;
    RTEdit: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    Opacity: TTrackBar;
    Label5: TLabel;
    ResetBtn: TBitBtn;
    BlinkCheck: TCheckBox;
    SndCheck: TCheckBox;
    ZeroBtn: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure OpacityChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZeroBtnClick(Sender: TObject);
    procedure ResetBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

uses uCiliegino;

{$R *.dfm}

procedure TSettingsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Form1.SpeedButton1.Enabled:=True;
  If Form1.T1.Enabled=false then
  Form1.T1.Enabled:=True;
end;

procedure TSettingsForm.BitBtn1Click(Sender: TObject);
begin
  WT:=WTEdit.Value;
  RT:=RTEdit.Value;
  SettingsForm.Close;
  Blink:=BlinkCheck.Checked;
  SND:=SndCheck.Checked;
end;

procedure TSettingsForm.OpacityChange(Sender: TObject);
begin
  Opa:=Opacity.Position;
  if SetWindowLong(Form1.Handle, GWL_EXSTYLE, WS_EX_LAYERED) <> 0 then
    SetLayeredWindowAttributes(Form1.Handle, clNone, Opa, LWA_ALPHA);
end;

procedure TSettingsForm.FormShow(Sender: TObject);
begin
  WTEdit.Value:=WT;
  RTEdit.Value:=RT;
  Opacity.Position:=Opa;
  SndCheck.Checked:=SND;
  BlinkCheck.Checked:=Blink;  
end;

procedure TSettingsForm.ZeroBtnClick(Sender: TObject);
begin
  Pomodoro:=0;
  Form1.LabelSession.Caption:='01';
end;

procedure TSettingsForm.ResetBtnClick(Sender: TObject);
begin
  Form1.EndSession(Sender);
end;

end.
