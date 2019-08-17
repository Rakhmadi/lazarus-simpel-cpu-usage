// GET TOTAL CPU USAGE

unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Menus, BCRadialProgressBar,
  BGRAFlashProgressBar, DTAnalogGauge, ColorSpeedButton, BCImageButton,
  BCButton, BCLabel, BGRAKnob, BGRAVirtualScreen, BCMaterialDesignButton, Types,
  Unit3, unit2, FXRadialProgressBar, FXMaterialButton, process, RTTICtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BGRAFlashProgressBar1: TBGRAFlashProgressBar;
    BGRAFlashProgressBar2: TBGRAFlashProgressBar;
    FXMaterialButton1: TFXMaterialButton;
    FXRadialProgressBar1: TFXRadialProgressBar;
    FXRadialProgressBar2: TFXRadialProgressBar;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    PopupMenu1: TPopupMenu;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    TrayIcon1: TTrayIcon;

    procedure BGRAFlashProgressBar1Click(Sender: TObject);
    procedure BGRAFlashProgressBar2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FXMaterialButton1Click(Sender: TObject);
    procedure FXRadialProgressBar1Click(Sender: TObject);
    procedure FXRadialProgressBar2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Close(Sender: TObject);
    procedure ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  MouseIsDown: boolean;
  PX, PY: integer;
  PowerStatus:TSystemPowerStatus;

implementation

{$R *.lfm}

{ TForm1 }

function GetProcessorTime : int64;
type
  TPerfDataBlock = packed record
    signature              : array [0..3] of wchar;
    littleEndian           : cardinal;
    version                : cardinal;
    revision               : cardinal;
    totalByteLength        : cardinal;
    headerLength           : cardinal;
    numObjectTypes         : integer;
    defaultObject          : cardinal;
    systemTime             : TSystemTime;
    perfTime               : comp;
    perfFreq               : comp;
    perfTime100nSec        : comp;
    systemNameLength       : cardinal;
    systemnameOffset       : cardinal;
  end;
  TPerfObjectType = packed record
    totalByteLength        : cardinal;
    definitionLength       : cardinal;
    headerLength           : cardinal;
    objectNameTitleIndex   : cardinal;
    objectNameTitle        : PWideChar;
    objectHelpTitleIndex   : cardinal;
    objectHelpTitle        : PWideChar;
    detailLevel            : cardinal;
    numCounters            : integer;
    defaultCounter         : integer;
    numInstances           : integer;
    codePage               : cardinal;
    perfTime               : comp;
    perfFreq               : comp;
  end;
  TPerfCounterDefinition = packed record
    byteLength             : cardinal;
    counterNameTitleIndex  : cardinal;
    counterNameTitle       : PWideChar;
    counterHelpTitleIndex  : cardinal;
    counterHelpTitle       : PWideChar;
    defaultScale           : integer;
    defaultLevel           : cardinal;
    counterType            : cardinal;
    counterSize            : cardinal;
    counterOffset          : cardinal;
  end;
  TPerfInstanceDefinition = packed record
    byteLength             : cardinal;
    parentObjectTitleIndex : cardinal;
    parentObjectInstance   : cardinal;
    uniqueID               : integer;
    nameOffset             : cardinal;
    nameLength             : cardinal;
  end;
var  c1, c2, c3      : cardinal;
     i1, i2          : integer;
     perfDataBlock   : ^TPerfDataBlock;
     perfObjectType  : ^TPerfObjectType;
     perfCounterDef  : ^TPerfCounterDefinition;
     perfInstanceDef : ^TPerfInstanceDefinition;
begin
  result := 0;
  perfDataBlock := nil;
  try
    c1 := $10000;
    while true do begin
      ReallocMem(perfDataBlock, c1);
      c2 := c1;
      case RegQueryValueEx(HKEY_PERFORMANCE_DATA, '238', nil, @c3, pointer(perfDataBlock), @c2) of
        ERROR_MORE_DATA : c1 := c1 * 2;
        ERROR_SUCCESS   : break;
        else              exit;
      end;
    end;
    perfObjectType := pointer(cardinal(perfDataBlock) + perfDataBlock^.headerLength);
    for i1 := 0 to perfDataBlock^.numObjectTypes - 1 do begin
      if perfObjectType^.objectNameTitleIndex = 238 then begin   // 238 -> "Processor"
        perfCounterDef := pointer(cardinal(perfObjectType) + perfObjectType^.headerLength);
        for i2 := 0 to perfObjectType^.numCounters - 1 do begin
          if perfCounterDef^.counterNameTitleIndex = 6 then begin    // 6 -> "% Processor Time"
            perfInstanceDef := pointer(cardinal(perfObjectType) + perfObjectType^.definitionLength);
            result := PInt64(cardinal(perfInstanceDef) + perfInstanceDef^.byteLength + perfCounterDef^.counterOffset)^;
            break;
          end;
          inc(perfCounterDef);
        end;
        break;
      end;
      perfObjectType := pointer(cardinal(perfObjectType) + perfObjectType^.totalByteLength);
    end;
  finally FreeMem(perfDataBlock) end;
end;

var LastTickCount     : cardinal = 0;
    LastProcessorTime : int64    = 0;

function GetProcessorUsage : integer;
var tickCount     : cardinal;
    processorTime : int64;
begin
  result := 0;
  tickCount     := GetTickCount;
  processorTime := GetProcessorTime;
  if (LastTickCount <> 0) and (tickCount <> LastTickCount) then
    result := 100 - Round(((processorTime - LastProcessorTime) div 100) / (tickCount - LastTickCount));
  LastTickCount     := tickCount;
  LastProcessorTime := processorTime;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  image4.Hide;
   trayicon1.Show;
   label5.Caption:='0';
   panel6.Hide;

end;

procedure TForm1.FXMaterialButton1Click(Sender: TObject);
begin
   timer4.Enabled:=true;
   FXMaterialButton1.Caption:='Wait';
end;

procedure TForm1.FXRadialProgressBar1Click(Sender: TObject);
begin

end;

procedure TForm1.FXRadialProgressBar2Click(Sender: TObject);
begin

end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin

end;

procedure TForm1.Image7Click(Sender: TObject);
begin
  form2.Show;
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
  form3.show;
end;

procedure TForm1.Label12Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label6Click(Sender: TObject);
begin

end;

procedure TForm1.Label7Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbLeft then begin
    MouseIsDown := True;
    PX := X;
    PY := Y;
  end;
end;

procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if MouseIsDown then begin
  SetBounds(Form1.Left + (X - PX), Form1.Top + (Y - PY), Form1.Width, Form1.Height);
end;
end;

procedure TForm1.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    MouseIsDown:=False;
end;

procedure TForm1.PopupMenu1Close(Sender: TObject);
begin

end;

procedure TForm1.ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Label1.Caption:=intToStr(GetProcessorUsage);
   Trayicon1.Hint:=label1.Caption;
  FXRadialProgressBar1.Value:=strtoint(label1.Caption);

end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if GetSystemPowerStatus(PowerStatus) then
    begin
    if (PowerStatus.BatteryFlag and 8) <>0 then
      begin
      image4.Show;
      FXRadialProgressBar2.Value:=100;
      panel6.Show;
      FXRadialProgressBar2.Linecolor:=clred;
      end
    else
    begin
      BGRAFlashProgressBar2.Color:=$00ECEC00;
      label5.Caption:=IntToStr(PowerStatus.BatteryLifePercent);
      image4.Hide;
      panel6.Hide;
      FXRadialProgressBar2.LineColor:=clMenuHighlight;
      BGRAFlashProgressBar2.Value:=strtoint(label5.Caption);
      FXRadialProgressBar2.Value:=strtoint(label5.Caption);
     end
    end;

  label6.Caption:=label5.Caption;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  label9.Caption:=timetostr(time);
  label11.Caption:=datetostr(date);
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
  form1.Hide;
end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
  form1.Show;
  timer4.Enabled:=false;
  FXMaterialButton1.Caption:='Hide';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

end;



procedure TForm1.BGRAFlashProgressBar1Click(Sender: TObject);
begin

end;

procedure TForm1.BGRAFlashProgressBar2Click(Sender: TObject);
begin

end;

end.
