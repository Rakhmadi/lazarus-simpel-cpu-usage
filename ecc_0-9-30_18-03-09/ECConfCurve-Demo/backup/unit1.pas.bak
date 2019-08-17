unit Unit1;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Spin, ECConfCurve, ECRuler, ECEditBtns;

type
  { TForm1 }
  TForm1 = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    ChBFixedX: TCheckBox;
    ChBFixedY: TCheckBox;
    CmbBtyle: TComboBox;
    ECConfCurve1: TECConfCurve;
    ECRuler1: TECRuler;
    ECRuler2: TECRuler;
    ECSBAddPt: TECSpeedBtn;
    ECSBGudilines: TECSpeedBtn;
    ECSBReversed: TECSpeedBtn;
    ECSBShowGrid: TECSpeedBtn;
    ECSBEnabled: TECSpeedBtn;
    ECSBClearPts: TECSpeedBtn;
    ECSBSnapToGrid: TECSpeedBtn;
    ECSBFixedMin: TECSpeedBtn;
    ECSBFixedMax: TECSpeedBtn;
    FSESmoothness: TFloatSpinEdit;
    GBPoints: TGroupBox;
    SEPoint: TSpinEdit;
    procedure ChBFixedXChange(Sender: TObject);
    procedure ChBFixedYChange(Sender: TObject);
    procedure CmbBtyleChange(Sender: TObject);
    procedure ECConfCurve1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ECSBAddPtClick(Sender: TObject);
    procedure ECSBClearPtsClick(Sender: TObject);
    procedure ECSBEnabledChange(Sender: TObject);
    procedure ECSBFixedMaxChange(Sender: TObject);
    procedure ECSBFixedMinChange(Sender: TObject);
    procedure ECSBShowGridChange(Sender: TObject);
    procedure ECSBGudilinesChange(Sender: TObject);
    procedure ECSBReversedChange(Sender: TObject);
    procedure ECSBSnapToGridChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FSESmoothnessChange(Sender: TObject);
    procedure SEPointChange(Sender: TObject);
  private
    { private declarations }
    procedure SetGBPointsEnabled;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  ECRuler2.IndentBottomRight:=ECRuler1.Height+ECRuler1.BorderSpacing.Top;
  FSESmoothness.Value:=ECConfCurve1.Smoothness;
end;

procedure TForm1.FSESmoothnessChange(Sender: TObject);
begin
  ECConfCurve1.Smoothness:=TFloatSpinEdit(Sender).Value;
end;

procedure TForm1.SEPointChange(Sender: TObject);
var i: Integer;
begin
  i:=TSpinEdit(Sender).Value;
  if i<length(ECConfCurve1.Points) then
    begin
      ChBFixedX.OnChange:=nil;
      ChBFixedY.OnChange:=nil;
      ChBFixedX.Checked:= epoFixedX in ECConfCurve1.Points[i].Options;
      ChBFixedY.Checked:= epoFixedY in ECConfCurve1.Points[i].Options;
      ChBFixedX.OnChange:=@ChBFixedXChange;
      ChBFixedY.OnChange:=@ChBFixedYChange;
    end;
end;

procedure TForm1.SetGBPointsEnabled;
begin
  GBPoints.Enabled:= (length(ECConfCurve1.Points)>0);
end;

procedure TForm1.ECSBAddPtClick(Sender: TObject);
begin
  ECConfCurve1.AddPoint;
  SetGBPointsEnabled;
end;

procedure TForm1.ECSBClearPtsClick(Sender: TObject);
begin
  ECConfCurve1.ClearPoints;
  SetGBPointsEnabled;
end;

procedure TForm1.ECSBEnabledChange(Sender: TObject);
begin
  ECConfCurve1.Enabled:=TECSpeedBtn(Sender).Checked;
  ECRuler1.Enabled:=TECSpeedBtn(Sender).Checked;
  ECRuler2.Enabled:=TECSpeedBtn(Sender).Checked;
end;

procedure TForm1.ECSBFixedMaxChange(Sender: TObject);
begin
  if TECSpeedBtn(Sender).Checked
    then ECConfCurve1.Options:=ECConfCurve1.Options+[ecoFixedMax]
    else ECConfCurve1.Options:=ECConfCurve1.Options-[ecoFixedMax];
end;

procedure TForm1.ECSBFixedMinChange(Sender: TObject);
begin
  if TECSpeedBtn(Sender).Checked
    then ECConfCurve1.Options:=ECConfCurve1.Options+[ecoFixedMin]
    else ECConfCurve1.Options:=ECConfCurve1.Options-[ecoFixedMin];
end;

procedure TForm1.ECSBShowGridChange(Sender: TObject);
begin
  if TECSpeedBtn(Sender).Checked
    then ECConfCurve1.Options:=ECConfCurve1.Options+[ecoShowGrid]
    else ECConfCurve1.Options:=ECConfCurve1.Options-[ecoShowGrid];
end;

procedure TForm1.ECConfCurve1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ECRuler1.Position:=X/ECConfCurve1.Width;
  ECRuler2.Position:=1-Y/ECConfCurve1.Height;
end;

procedure TForm1.CmbBtyleChange(Sender: TObject);
begin
  case TComboBox(Sender).ItemIndex of
    0:
      begin
        ECConfCurve1.Style:=ecsLinear;
        FSESmoothness.Enabled:=False;
      end;
    1:
      begin
        ECConfCurve1.Style:=ecsBezier;
        FSESmoothness.Enabled:=True;
      end;
  end;
end;

procedure TForm1.ChBFixedXChange(Sender: TObject);
var i: Integer;
begin
  i:=SEPoint.Value;
  if i<length(ECConfCurve1.Points) then
    begin
      if TCheckBox(Sender).Checked
        then ECConfCurve1.Points[i].Options:=ECConfCurve1.Points[i].Options+[epoFixedX]
        else ECConfCurve1.Points[i].Options:=ECConfCurve1.Points[i].Options-[epoFixedX];
      ECConfCurve1.Invalidate;
    end;
end;

procedure TForm1.ChBFixedYChange(Sender: TObject);
var i: Integer;
begin
  i:=SEPoint.Value;
  if i<length(ECConfCurve1.Points) then
    begin
      if TCheckBox(Sender).Checked
        then ECConfCurve1.Points[i].Options:=ECConfCurve1.Points[i].Options+[epoFixedY]
        else ECConfCurve1.Points[i].Options:=ECConfCurve1.Points[i].Options-[epoFixedY];
      ECConfCurve1.Invalidate;
    end;
end;

procedure TForm1.ECSBGudilinesChange(Sender: TObject);
begin
  if TECSpeedBtn(Sender).Checked then
    begin
      ECConfCurve1.Options:=ECConfCurve1.Options+[ecoGuidelines];
      ECRuler1.PointerMode:=epmFixed;
      ECRuler2.PointerMode:=epmFixed;
    end else
    begin
      ECConfCurve1.Options:=ECConfCurve1.Options-[ecoGuidelines];
      ECRuler1.PointerMode:=epmNone;
      ECRuler2.PointerMode:=epmNone;
    end;
end;

procedure TForm1.ECSBReversedChange(Sender: TObject);
begin
  if TECSpeedBtn(Sender).Checked then
    begin
      ECConfCurve1.Options:=ECConfCurve1.Options+[ecoReversed];
      ECRuler1.Reversed:=True;
    end else
    begin
      ECConfCurve1.Options:=ECConfCurve1.Options-[ecoReversed];
      ECRuler1.Reversed:=False;
    end;
end;

procedure TForm1.ECSBSnapToGridChange(Sender: TObject);
begin
  if TECSpeedBtn(Sender).Checked
    then ECConfCurve1.Options:=ECConfCurve1.Options+[ecoSnapToGrid]
    else ECConfCurve1.Options:=ECConfCurve1.Options-[ecoSnapToGrid];
end;

end.

