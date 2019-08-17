unit Unit1;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls, Spin, ECGrid, ECEditBtns, FGL;

type
  { TDemoData }
  TDemoData = class
  private
    FCategory: string;
    FCount: Integer;
    FDepth: Integer;
    FHeight: Integer;
    FName: string;
    FWeight: Integer;
    FWidth: Integer;
  public
    property Category: string read FCategory write FCategory;
    property Count: Integer read FCount write FCount;
    property Depth: Integer read FDepth write FDepth;
    property Height: Integer read FHeight write FHeight;
    property Name: string read FName write FName;
    property Weight: Integer read FWeight write FWeight;
    property Width: Integer read FWidth write FWidth;
  end;

  TDemoList = specialize TFPGObjectList<TDemoData>;

  { TForm1 }
  TForm1 = class(TForm)
    ECGrid1: TECGrid;
    ECGrid2: TECGrid;
    ECSpeedBtn1: TECSpeedBtn;
    ECSpeedBtn2: TECSpeedBtn;
    Edit1: TEdit;
    PageControl1: TPageControl;
    SpinEdit1: TSpinEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure ECGrid1GetDataRowCount(Sender: TObject; var ADataRowCount: Integer);
    procedure ECGrid2Columns0GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
    procedure ECGrid2Columns1GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
    procedure ECGrid2Columns2GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
    procedure ECGrid2Columns3GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
    procedure ECGrid2Columns4GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
    procedure ECGrid2Columns5GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
    procedure ECGrid2Columns6GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
    procedure ECGrid2Columns7GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
    procedure ECGrid2GetDataRowCount(Sender: TObject; var ADataRowCount: Integer);
    procedure ECGrid2SelectEditor(Sender: TObject; ACol, ADataRow: Integer; var AEditor: TWinControl; AKey: Word=0);
    procedure ECSpeedBtn1Click(Sender: TObject);
    procedure ECSpeedBtn2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    procedure ECG1GetDataCellText(AColumn: TECGColumn; ARow: Integer; out AStr: string);
    procedure EdDoneName(Sender: TObject);
    procedure EdDoneCat(Sender: TObject);
    procedure EdChangeCount(Sender: TObject);
    procedure EdChangeDepth(Sender: TObject);
    procedure EdChangeHeight(Sender: TObject);
    procedure EdChangeWidth(Sender: TObject);
    procedure EdChangeWeight(Sender: TObject);
  public
    { public declarations }
    LData: TDemoList;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ECG1GetDataCellText(AColumn: TECGColumn; ARow: Integer; out AStr: string);
begin
  AStr:='C'+intToStr(AColumn.Index)+' R'+intToStr(ARow);
end;

procedure TForm1.ECGrid1GetDataRowCount(Sender: TObject; var ADataRowCount: Integer);
begin
  ADataRowCount:=10000000;
end;

procedure TForm1.ECGrid2Columns0GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
begin
  AText:=intToStr(ADataRow);
end;

procedure TForm1.ECGrid2Columns1GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
begin
  AText:=LData[ADataRow].Name;
end;

procedure TForm1.ECGrid2Columns2GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
begin
  AText:=LData[ADataRow].Category;
end;

procedure TForm1.ECGrid2Columns3GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
begin
  AText:=intToStr(LData[ADataRow].Count);
end;

procedure TForm1.ECGrid2Columns4GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
begin
  AText:=intToStr(LData[ADataRow].Depth);
end;

procedure TForm1.ECGrid2Columns5GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
begin
  AText:=intToStr(LData[ADataRow].Height);
end;

procedure TForm1.ECGrid2Columns6GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
begin
  AText:=intToStr(LData[ADataRow].Width);
end;

procedure TForm1.ECGrid2Columns7GetDataCellText(AColumn: TECGColumn; ADataRow: Integer; out AText: string);
begin
  AText:=intToStr(LData[ADataRow].Weight);
end;

procedure TForm1.ECGrid2GetDataRowCount(Sender: TObject; var ADataRowCount: Integer);
begin
  ADataRowCount:=LData.Count;
end;

procedure TForm1.ECGrid2SelectEditor(Sender: TObject; ACol, ADataRow: Integer; var AEditor: TWinControl; AKey: Word=0);
begin
  case TECGrid(Sender).ColOrd[ACol] of
    1:
      begin
        Edit1.OnEditingDone:=nil;
        Edit1.Text:=LData[ADataRow].Name;
        Edit1.OnEditingDone:=@EdDoneName;
        AEditor:=Edit1;
      end;
    2:
      begin
        Edit1.OnEditingDone:=nil;
        Edit1.Text:=LData[ADataRow].Category;
        Edit1.OnEditingDone:=@EdDoneCat;
        AEditor:=Edit1;
      end;
    3:
      begin
        SpinEdit1.OnChange:=nil;
        SpinEdit1.Value:=LData[ADataRow].Count;
        SpinEdit1.OnChange:=@EdChangeCount;
        AEditor:=SpinEdit1;
      end;
    4:
      begin
        SpinEdit1.OnChange:=nil;
        SpinEdit1.Value:=LData[ADataRow].Depth;
        SpinEdit1.OnChange:=@EdChangeDepth;
        AEditor:=SpinEdit1;
      end;
    5:
      begin
        SpinEdit1.OnChange:=nil;
        SpinEdit1.Value:=LData[ADataRow].Height;
        SpinEdit1.OnChange:=@EdChangeHeight;
        AEditor:=SpinEdit1;
      end;
    6:
      begin
        SpinEdit1.OnChange:=nil;
        SpinEdit1.Value:=LData[ADataRow].Width;
        SpinEdit1.OnChange:=@EdChangeWidth;
        AEditor:=SpinEdit1;
      end;
    7:
      begin
        SpinEdit1.OnChange:=nil;
        SpinEdit1.Value:=LData[ADataRow].Weight;
        SpinEdit1.OnChange:=@EdChangeWeight;
        AEditor:=SpinEdit1;
      end;
  end;
  AEditor.BoundsRect:=TECGrid(Sender).CellRectEditor(ACol, ADataRow);
end;

procedure TForm1.ECSpeedBtn1Click(Sender: TObject);
begin
  ECGrid2.SaveColumnsToXML(ChangeFileExt(Application.ExeName, '.xml'), 'Columns');
end;

procedure TForm1.ECSpeedBtn2Click(Sender: TObject);
begin
  ECGrid2.LoadColumnsFromXML(ChangeFileExt(Application.ExeName, '.xml'), 'Columns');
end;

procedure TForm1.EdChangeCount(Sender: TObject);
begin
  LData[ECGrid2.Row-ECGrid2.FixedRows].Count:=TSpinEdit(Sender).Value;
end;

procedure TForm1.EdChangeDepth(Sender: TObject);
begin
  LData[ECGrid2.Row-ECGrid2.FixedRows].Depth:=TSpinEdit(Sender).Value;
end;

procedure TForm1.EdChangeHeight(Sender: TObject);
begin
  LData[ECGrid2.Row-ECGrid2.FixedRows].Height:=TSpinEdit(Sender).Value;
end;

procedure TForm1.EdChangeWeight(Sender: TObject);
begin
  LData[ECGrid2.Row-ECGrid2.FixedRows].Weight:=TSpinEdit(Sender).Value;
end;

procedure TForm1.EdChangeWidth(Sender: TObject);
begin
  LData[ECGrid2.Row-ECGrid2.FixedRows].Width:=TSpinEdit(Sender).Value;
end;

procedure TForm1.EdDoneCat(Sender: TObject);
begin
  LData[ECGrid2.Row-ECGrid2.FixedRows].Category:=TEdit(Sender).Text;
end;

procedure TForm1.EdDoneName(Sender: TObject);
begin
  LData[ECGrid2.Row-ECGrid2.FixedRows].Name:=TEdit(Sender).Text;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=13 then ECGrid2.EditorMode:=False;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  LData.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i: Integer;
    aCol: TECGColumn;
    aData: TDemoData;
begin
  with ECGrid1 do
    begin
      BeginUpdate;
      for i:=0 to 9999 do
        begin
          aCol:=Columns.Add;
          aCol.OnGetDataCellText:=@ECG1GetDataCellText;
        end;
      EndUpdate;
    end;
  LData:=TDemoList.Create(True);
  for i:=0 to 19 do
    begin
      aData:=TDemoData.Create;
      with aData do
        begin
          Name:='Name'+intToStr(i);
          Category:='Category';
          Count:=10*i+i;
          Depth:=40+4*i;
          Height:=20+2*i;
          Weight:=10*i-2*i;
          Width:=30+3*i;
        end;
      LData.Add(aData);
    end;
  ECGrid2.UpdateRowCount;
end;

end.

