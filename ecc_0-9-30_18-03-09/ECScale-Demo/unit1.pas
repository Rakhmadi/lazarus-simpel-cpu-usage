unit Unit1;             
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, RTTIGrids, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls, 
  ECScale,  //TECScale
  ECTypes, ECRuler;  //base types for EC-Controls

type
  TScaleAlign = (saTopLeft, saBottomRight);
  TOrientation = (oHorizontal, oVertical);
  
  { TMyComponent }      
  TMyComponent = class(TGraphicControl)
  private
    FOrientation: TOrientation;
    FScale: TECScale;
    FScaleAlign: TScaleAlign;
    FIndent: SmallInt;
    function GetMinimum: Double;
    function GetMaximum: Double; 
    procedure SetOrientation(AValue: TOrientation);
    procedure SetScaleAlign(AValue: TScaleAlign);
    procedure SetMinimum(AValue: Double);
    procedure SetMaximum(AValue: Double);
    procedure SetIndent(AValue: SmallInt);
  protected
    procedure Paint; override;
    procedure RecalcRedraw;
    procedure Redraw;
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled;
    //Indent of Scale [pixels] from edges of the component
    property Indent: SmallInt read FIndent write SetIndent default 25;
    //Minimum (the begining) of the Scale (reads and writes Scale.Min)
    property Minimum: Double read GetMinimum write SetMinimum;
    //Maximum (the end) of the Scale (reads and writes Scale.Max)
    property Maximum: Double read GetMaximum write SetMaximum;	
    //Denotes whether the component is horizontal or vertical
    property Orientation: TOrientation read FOrientation write SetOrientation default oHorizontal;
    //Alignment of the Scale
    property ScaleAlign: TScaleAlign read FScaleAlign write SetScaleAlign default saTopLeft;
    //... and the subclass Scale itself
    property Scale: TECScale read FScale write FScale;		
  end;
  
  { TForm1 }

  TForm1 = class(TForm)
    TIPropertyGrid1: TTIPropertyGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ECRuler1: TECRuler;
    ECRuler2: TECRuler;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  MyC: TMyComponent;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked
    then ECRuler1.Scale.Correction:=0.1
    else ECRuler1.Scale.Correction:=0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MyC:=TMyComponent.Create(self);
  with MyC do
    begin
      Left:=10;
      Top:=10;
      Parent:=TabSheet1;
    end;
  TIPropertyGrid1.TIObject:=MyC;   
end;

{ TMyComponent }

constructor TMyComponent.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIndent:=25;
  FOrientation:=oHorizontal;
  FScaleAlign:=saTopLeft;   
  FScale:=TECScale.Create(self);   
  //set min. and max.
  Minimum:=-0.5;
  Maximum:=10; 
  //assign ticks & values
  //multipliers of 1 will have long ticks
  FScale.TickLongValue:=1;
  //multipliers of 0.5 will have middle ticks
  FScale.TickMiddleValue:=0.5;
  //multipliers of 0.1 will have short ticks
  FScale.TickShortValue:=0.1;
  //set format of rounding
  FScale.Digits:=1;
  FScale.ValueFormat:=esvfSmartRound;
  //set decent font-size
  Font.Size:=7;
  SetInitialBounds(0, 0, 400, 60);
  //assign events of Scale, they are triggered when relevant properties of TECScale are changed
  FScale.OnRedraw:=@Redraw;
  FScale.OnRecalcRedraw:=@RecalcRedraw;   
end;

destructor TMyComponent.Destroy;
begin
  FreeAndNil(FScale);  //Scale is derived from TPersistent => must be freed manually!
  inherited Destroy;
end;

function TMyComponent.GetMaximum: Double;
begin
  Result:=Scale.Max;
end;

function TMyComponent.GetMinimum: Double;
begin
  Result:=Scale.Min;
end;

procedure TMyComponent.Paint;
var aPoint: TPoint;
    aPos: TObjectPos;
begin
  inherited Paint;
  if Orientation=oHorizontal then
    begin
      if ScaleAlign=saTopLeft then 
        begin
          aPos:=eopBottom;
          aPoint:=Point(Indent, 0);
        end else
        begin
          aPos:=eopTop;
          aPoint:=Point(Indent, Height);
        end;
    end else
    begin
      if ScaleAlign=saTopLeft then
        begin
          aPos:=eopRight;
          aPoint:=Point(0, Indent);
        end else
        begin
          aPos:=eopLeft;
          aPoint:=Point(Width, Indent);
        end;
    end;
  Scale.Draw(
  self.Canvas,   //Target Canvas
  True,          //we want Ticks
  True,          //we want values (descriptive numbers)
  aPos,          //position of the Scale
  aPoint,        //point where the Scale starts
  []);           //some extra values that can be passed to Scale, leave it empty for this simple example
end;

procedure TMyComponent.RecalcRedraw;
var aLength: Integer;
begin
  if Orientation=oHorizontal
    then aLength:=Width
    else aLength:=Height;
  dec(aLength, 2*Indent);
  FScale.CalcTickPosAndValues(aLength, False);
  Invalidate;
end;

procedure TMyComponent.Redraw;
begin
  Invalidate;
end;

procedure TMyComponent.Resize;
begin
  inherited Resize;
  RecalcRedraw;
end;

procedure TMyComponent.SetIndent(AValue: SmallInt);
begin
  if FIndent=AValue then Exit;
  FIndent:=AValue;
  RecalcRedraw;
end;

procedure TMyComponent.SetMaximum(AValue: Double);
begin
  Scale.Max:=AValue;
end;

procedure TMyComponent.SetMinimum(AValue: Double);
begin
  Scale.Min:=AValue;
end;

procedure TMyComponent.SetOrientation(AValue: TOrientation);
var i: Integer;
begin
  if FOrientation=AValue then Exit;
  FOrientation:=AValue;
  i:=Width;
  Width:=Height;
  Height:=i;
end;

procedure TMyComponent.SetScaleAlign(AValue: TScaleAlign);
begin
  if FScaleAlign=AValue then Exit;
  FScaleAlign:=AValue;
  Redraw;
end;

end.

