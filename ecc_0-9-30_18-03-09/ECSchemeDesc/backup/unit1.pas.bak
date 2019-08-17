unit Unit1;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, ECScheme;

type
  { TECDevDesc }
  TECDevDesc = class(TECDevice)
  private
    FAnyProp: Double;
    FKind: string;
  public
    property AnyProp: Double read FAnyProp write FAnyProp;
    property Kind: string read FKind write FKind;
  end;

  { TECDevsDesc }
  TECDevsDesc = class(TECDevices)
  public
    function AddDevice: Integer; override;
    function AddConnection(AInput, AOutput: Integer; AColor: TColor=clDefault; AOptions: TConnectionOptions=
      cDefConnOpts): TAddConnectionResult; override;
  end;

  { TECSchemeDesc }
  TECSchemeDesc = class(TCustomECScheme)
  protected
    procedure CreateDevices; override;
    procedure PaintConnection(ADevice, AOutput: Integer; ADefColor: TColor; BFullRepaint: Boolean); override;
    procedure PaintContent(AIndex: Integer; ABlockRect: TRect); override;
  end;

  { TForm1 }
  TForm1 = class(TForm)
    BtnCreate: TButton;
    procedure BtnCreateClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

const
  ecoPositive: TConnectionOption = ecoUser0;
  edoPositive: TDeviceOption = edoUser0;

var
  Form1: TForm1;
  ESD: TECSchemeDesc;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BtnCreateClick(Sender: TObject);
begin
  ESD:=TECSchemeDesc.Create(self);
  with ESD do
    begin
      BlockHeight:=50;
      Devices.AddDevice;
      TECDevDesc(Devices[0]).AnyProp:=11;
      TECDevDesc(Devices[0]).Kind:='Ultra';
      TECDevDesc(Devices[0]).Options:=TECDevDesc(Devices[0]).Options+[edoPositive];
      Devices.AddDevice;
      TECDevDesc(Devices[1]).AnyProp:=22;
      TECDevDesc(Devices[1]).Kind:='Infra';
      TECDevDesc(Devices[1]).Options:=TECDevDesc(Devices[1]).Options-[edoPositive];
      TECDevDesc(Devices[1]).Left:=125;
      Devices.AddConnection(0, 1, clYellow, TECDevices.cDefConnOpts+[ecoPositive]);
      Parent:=self;
    end;
end;

{ TECDevsDesc }

function TECDevsDesc.AddConnection(AInput, AOutput: Integer; AColor: TColor;
  AOptions: TConnectionOptions): TAddConnectionResult;
begin
  Result:=inherited AddConnection(AInput, AOutput, AColor, AOptions);
end;

function TECDevsDesc.AddDevice: Integer;
var aItem: TECDevDesc;
    aPoint: TPoint;
begin
  aItem:=TECDevDesc.Create;
  aItem.Caption:=aItem.cDefCaption+inttostr(Count);
  aItem.FOwner:=self;
  aItem.Height:=FScheme.BlockHeight;
  aItem.Style:=FScheme.BlockStyle;
  aItem.Width:=FScheme.BlockWidth;
  aPoint:=FScheme.GetNewDevicePos;
  aItem.Left:=aPoint.X;
  aItem.Top:=aPoint.Y;
  Result:=Add(AItem);
  if Result>=0 then
    begin
      CalculateItem(aItem);
      UpdateScheme;
    end;
end;

{ TECSchemeDesc }

procedure TECSchemeDesc.CreateDevices;
begin
  Devices:=TECDevsDesc.Create(True);
end;

procedure TECSchemeDesc.PaintConnection(ADevice, AOutput: Integer; ADefColor: TColor;
  BFullRepaint: Boolean);
begin
  inherited PaintConnection(ADevice, AOutput, ADefColor, BFullRepaint);
  Canvas.Font.Color:=clBtnText;
  if ecoPositive in Devices[ADevice].Outputs[AOutput].Options then
    Canvas.TextOut(Devices[ADevice].Left-15, Devices[ADevice].Top+5, '+');
end;

procedure TECSchemeDesc.PaintContent(AIndex: Integer; ABlockRect: TRect);
var c: Char;
begin
  inherited PaintContent(AIndex, ABlockRect);
  Canvas.Font.Color:=clRed;
  Canvas.TextOut(ABlockRect.Left+2, ABlockRect.Top+2, inttostr(trunc(TECDevDesc(Devices[AIndex]).AnyProp)));
  Canvas.Font.Color:=clBlue;
  Canvas.TextOut(ABlockRect.Left+2, ABlockRect.Bottom-12, TECDevDesc(Devices[AIndex]).Kind);
  Canvas.Font.Color:=clLime;
  if edoPositive in TECDevDesc(Devices[AIndex]).Options
    then c:='+'
    else c:='-';
  Canvas.TextOut(ABlockRect.Right-10, ABlockRect.Top+2, c);
end;

end.

