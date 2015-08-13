unit uCiliegino;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls,mmSystem, Menus,IniFiles, ActnList,ShellApi;

type
  TForm1 = class(TForm)
    tlabel: TLabel;
    SpeedButton1: TSpeedButton;
    t1: TTimer;
    PopupMenu1: TPopupMenu;
    Exit1: TMenuItem;
    Settings1: TMenuItem;
    N2: TMenuItem;
    LabelSession: TLabel;
    ActionList1: TActionList;
    StartTimer: TAction;
    HELP1: TMenuItem;
    HelpShow: TAction;

    procedure SpeedButton1Click(Sender: TObject);
    procedure t1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EndSession(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tlabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Resiz(Width1,Height1:integer;Sender: TObject);
    Procedure breaksound(Sender:TObject);
    Procedure endbreaksound(Sender:TObject);
    procedure Settings1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZapEtcHosts;  // $TODO sometime disable internet for work period
    procedure ReleaseEtcHosts;
    procedure StartTimerExecute(Sender: TObject);
    procedure HelpShowExecute(Sender: TObject);

  private
    { Private declarations }
    keyid1: Integer;
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Seconds:Integer;
  TimerOn:Integer;
  Pomodoro:Integer;
  WT,W:Integer; // work time (in minutes) and counter (seconds)
  RT,R:Integer; // rest time (in minutes) and counter (seconds)
  SND:Boolean;  // sound on/off
  Opa:Integer;  // opacity 0..255
  LedState:Boolean;
  Blink:Boolean;
const
  SC_DragMove = $F012;  { a magic number }
  INI_FILENAME = 'Ciliegino.ini';
  HELP_FILENAME= 'help.txt';
implementation

uses uSettings;

{$R *.DFM} {$R cilieginores.RES}

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
//
end;


procedure TForm1.ZapEtcHosts;
var
  F:File;
begin
  //
end;

procedure TForm1.ReleaseEtcHosts;
var
  F:File;
begin
  //
end;


procedure Tform1.Resiz(Width1,Height1:Integer;Sender: TObject);
const
  C = 4;
var
  Points: array [0..7] of TPoint;
  h, w: Integer;
begin
  Form1.Width:=Width1;
  Form1.Height:=Height1;
  h := Form1.Height;
  w := Form1.Width;
  Points[0].X := C;     Points[0].Y := 0;
  Points[1].X := 0;     Points[1].Y := C;
  Points[2].X := 0;     Points[2].Y := h - c;
  Points[3].X := C;     Points[3].Y := h;

  Points[4].X := w - c; Points[4].Y := h;
  Points[5].X := w;     Points[5].Y := h - c;

  Points[6].X := w;     Points[6].Y := C;
  Points[7].X := w - C; Points[7].Y := 0;

  SetWindowRgn(Form1.Handle, CreatePolygonRgn(Points, 8, WINDING), True);
  SpeedButton1.Left:=48;
  SpeedButton1.Top:=0;
  SpeedButton1.Height:=25;
  LabelSession.Left:=39;
  LabelSession.Top:=12;
  tLabel.Left:=3;
  tLabel.Top:=0;
  tLabel.Height:=24;
end;

Procedure TForm1.breaksound(Sender:TObject);
var
  hFind, hRes: THandle;
  Song: PChar;
begin
 if SND then
 begin
   hFind := FindResource(HInstance, 'Break', 'WAVE') ;
   if hFind <> 0 then begin
     hRes:=LoadResource(HInstance, hFind) ;
     if hRes <> 0 then begin
       Song:=LockResource(hRes) ;
       if Assigned(Song) then SndPlaySound(Song, snd_ASync or snd_Memory) ;
       UnlockResource(hRes) ;
     end;
     FreeResource(hFind) ;
   end;
 end
end;

Procedure TForm1.endbreaksound(Sender:TObject);
var
  hFind, hRes: THandle;
  Song: PChar;
begin
 if SND then
 begin
   hFind := FindResource(HInstance, 'EndBreak', 'WAVE') ;
   if hFind <> 0 then begin
     hRes:=LoadResource(HInstance, hFind) ;
     if hRes <> 0 then begin
       Song:=LockResource(hRes) ;
       if Assigned(Song) then SndPlaySound(Song, snd_ASync or snd_Memory) ;
       UnlockResource(hRes) ;
     end;
     FreeResource(hFind) ;
   end;
 end;
end;

procedure TForm1.EndSession(Sender: TObject);
begin
   Form1.Color:=clGreen;
   Tlabel.Caption:='00';
   EndBreakSound(Sender);
   TimerOn:=0;
end;


procedure TForm1.t1Timer(Sender: TObject);
var
  m,s:byte;
  mm,ss:String;
begin
  If (W=1) then TimerOn:=1;

  If W>0 then
  begin
    If Blink then Form1.BlinkLed;
    Form1.Color:=clBlack;
    W:=W-1;
    m:=W div 60 +1;
    If m<10 then mm:='0'+IntToStr(m) else mm:=IntToStr(m);
    s:=W mod 60;
    If s<10 then ss:='0'+IntToStr(s) else ss:=IntToStr(s);
    Tlabel.Caption:=mm;
  end
    else
    if R>0 then
    begin
        If Blink then Form1.BlinkLed;
        Form1.Color:=clBlue;
        If TimerOn=1 then
        begin
          BreakSound(Sender);
          ReleaseEtcHosts;
          TimerOn:=0;
        end;
        R:=R-1;
        If R=0 then TimerOn:=1;
        m:=R div 60 +1;
        If m<10 then mm:='0'+IntToStr(m) else mm:=IntToStr(m);
        s:=R mod 60;
        If s<10 then ss:='0'+IntToStr(s) else ss:=IntToStr(s);
        Tlabel.Caption:=mm;
    end
      else
    begin
        If TimerOn=1 then
        begin
          EndSession(Sender);
        end;
    end;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  Tlabel.Caption:=IntToStr(WT);
  Form1.Color:=clGreen;
  TimerOn:=0;
  Pomodoro:=0;
  ShowWindow(Application.Handle, SW_HIDE) ;
   SetWindowLong(Application.Handle, GWL_EXSTYLE,
     getWindowLong(Application.Handle, GWL_EXSTYLE) or
     WS_EX_TOOLWINDOW) ;
   ShowWindow(Application.Handle, SW_SHOW) ;

  if SetWindowLong(Handle, GWL_EXSTYLE, WS_EX_LAYERED) <> 0 then
    SetLayeredWindowAttributes(Handle, clNone, Opa, LWA_ALPHA);
end;


procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Form1.Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TForm1.tlabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Form1.Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  INI:TIniFile;
  ExePath:String;
begin
//load settings
  ExePath:=ExtractFilePath(Application.ExeName);
  INI:=TIniFile.Create(ExePath+INI_FILENAME);
  try
    With INI Do
    begin
      WT:=ReadInteger('Time', 'WorkTime', 20);
      if ((WT<5) or (WT>60)) then WT:=20;
      WriteInteger('Time', 'WorkTime', WT);

      RT:=ReadInteger('Time', 'RestTime', 5);
      if ((RT<5) or (RT>60)) then RT:=5;
      WriteInteger('Time', 'RestTime', RT);

      SND:=ReadBool('Params', 'Sound', True);
      WriteBool('Params', 'Sound', SND);

      Opa:=ReadInteger('Params', 'Opacity', 192);

      Blink:=(ReadInteger('Params', 'Blink', 0)=1);

      if ((Opa<0) or (Opa>255)) then Opa:=192;
      WriteInteger('Params', 'Opacity', Opa);

      Form1.Left:=ReadInteger('Params', 'Left', 200);
      WriteInteger('Params', 'Left', Form1.Left);

      Form1.Top:=ReadInteger('Params', 'Top', 200);
      WriteInteger('Params', 'Top', Form1.Top);


    end;
  finally
    INI.Free;
  end;
  keyid1 := GlobalAddAtom('Hotkey1');
  RegisterHotKey(Handle, keyid1, MOD_CONTROL+MOD_ALT, $51);
  Resiz(85,25,Sender);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Form1.Close;
  Application.Terminate;
end;

procedure TForm1.Settings1Click(Sender: TObject);
begin
  t1.Enabled:=False;
  SpeedButton1.Enabled:=False;
  SettingsForm.Show;
end;



procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  INI:TIniFile;
  ExePath:String;
begin
//save settings
  ExePath:=ExtractFilePath(Application.ExeName);
  try
    INI:=TIniFile.Create(ExePath+INI_FILENAME);
    With INI Do
    begin
      WriteInteger('Time', 'WorkTime', WT);
      WriteInteger('Time', 'RestTime', RT);
      WriteBool('Params','Sound',SND);
      WriteInteger('Params','Opacity',Opa);
      WriteInteger('Params','Left',Form1.Left);
      WriteInteger('Params','Top',Form1.Top);
      If Blink then WriteInteger('Params','Blink',1) else WriteInteger('Params','Blink',0);
    end;
  finally
    INI.Free;
  end;
  UnRegisterHotKey(Handle, keyid1);
  GlobalDeleteAtom(keyid1);
end;

procedure TForm1.WMHotKey(var Msg: TWMHotKey);
begin
  if Msg.HotKey = keyid1 then
    if Speedbutton1.Enabled then SpeedButton1.Click;
end;

procedure TForm1.StartTimerExecute(Sender: TObject);
begin
  W:=WT*60;
  R:=RT*60;
  Pomodoro:=Pomodoro+1;
  BreakSound(Sender);
  ZapEtcHosts;
  Form1.Color:=clBlack;
  TimerOn:=1;
  If Pomodoro<10 then LabelSession.Caption:='0'+IntToStr(Pomodoro) else LabelSession.Caption:=IntToStr(Pomodoro);
end;

procedure TForm1.HelpShowExecute(Sender: TObject);
var
  ExePath:String;
begin
  ExePath:=ExtractFilePath(Application.ExeName);
  ShellExecute(Form1.Handle, nil, pchar(ExePath+HELP_FILENAME), nil, nil, SW_RESTORE);
end;

end.
