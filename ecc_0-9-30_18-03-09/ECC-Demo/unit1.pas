unit Unit1; 
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, RTTIGrids, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls, StdCtrls, ActnList, Menus,
  Grids, Spin, ECSwitch, ECSlider, ECImageMenu, ECSpinCtrls, ECEditBtns, ECProgressBar, ECRuler, DateUtils, ECTypes,
  ECGroupCtrls, ECBevel, ECLink, ECHeader, ECCheckListBox, ECTriangle, LCLType, Math, Types;

type          
  { TForm1 }
  TForm1 = class(TForm)
    ECBevel1: TECBevel;
    ECBevel2: TECBevel;
    ECBevel3: TECBevel;
    ECBevel4: TECBevel;
    ECBevel5: TECBevel;
    ECBevel6: TECBevel;
    ECBevel7: TECBevel;
    ECBevel8: TECBevel;
    ECCheckListBox1: TECCheckListBox;
    ECColorBtn11: TECColorBtn;
    ECColorCombo25: TECColorCombo;
    ECColorCombo26: TECColorCombo;
    ECComboBtn2: TECComboBtn;
    ECHeader1: TECHeader;
    ECLink1: TECLink;
    ECLink2: TECLink;
    ECLink3: TECLink;
    ECLink4: TECLink;
    ECSlider34: TECSlider;
    ECSpeedBtn42: TECSpeedBtn;
    ECSpeedBtn43: TECSpeedBtn;
    ECSpinPosition1: TECSpinPosition;
    ECSpinPosition2: TECSpinPosition;
    ECTriangle1: TECTriangle;
    ECTriangle2: TECTriangle;
    ECTriangle3: TECTriangle;
    GroupBox3: TGroupBox;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet15: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    ECSwitch1: TECSwitch;
    ECSwitch2: TECSwitch;
    ECSwitch3: TECSwitch;
    ECSwitch4: TECSwitch;
    ECSwitch5: TECSwitch;
    ECSwitch6: TECSwitch;
    ECSwitch7: TECSwitch;
    ECSwitch8: TECSwitch;
    ECSwitch9: TECSwitch;
    ECSwitch10: TECSwitch;
    ECSwitch11: TECSwitch;
    ECSwitch12: TECSwitch;
    ECSwitch13: TECSwitch;
    ECSwitch14: TECSwitch;
    ECSwitch15: TECSwitch;
    ECSwitch16: TECSwitch;
    ECSwitch17: TECSwitch;
    ECSwitch18: TECSwitch;
    ECSwitch19: TECSwitch;
    ECSwitch20: TECSwitch;
    ECSwitch21: TECSwitch;
    ECSwitch22: TECSwitch;
    ECSwitch23: TECSwitch;
    ECSwitch24: TECSwitch;
    ECSwitch25: TECSwitch;
    ECSwitch26: TECSwitch;
    ECSwitch27: TECSwitch;
    ECSwitch28: TECSwitch;
    ECSwitch29: TECSwitch;
    ECSwitch30: TECSwitch;
    ECSwitch31: TECSwitch;
    ECSwitch32: TECSwitch;
    ECSwitch33: TECSwitch;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    ECSwitch34: TECSwitch;
    ActionList1: TActionList;
    Action1: TAction;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    ECSwitch35: TECSwitch;
    ECSwitch36: TECSwitch;
    ECSwitch37: TECSwitch;
    ECSwitch38: TECSwitch;
    ECSwitch39: TECSwitch;
    ECSwitch40: TECSwitch;
    ECSwitch41: TECSwitch;
    ECSwitch42: TECSwitch;
    ECSwitch43: TECSwitch;
    ECSwitch44: TECSwitch;
    ECSwitch45: TECSwitch;
    ECSwitch46: TECSwitch;
    Label1: TLabel;
    ECSwitch47: TECSwitch;
    ECSwitch48: TECSwitch;
    ECSwitch49: TECSwitch;
    ECSwitch50: TECSwitch;
    ECSlider1: TECSlider;
    ECSlider2: TECSlider;
    ECSlider3: TECSlider;
    ECSlider4: TECSlider;
    ECSlider5: TECSlider;
    ECSlider6: TECSlider;
    ECSlider7: TECSlider;
    ECSlider8: TECSlider;
    ECSlider9: TECSlider;
    ECSlider10: TECSlider;
    ECSlider11: TECSlider;
    ECSlider12: TECSlider;
    PaintBox1: TPaintBox;
    ECSlider13: TECSlider;
    ECImageMenu1: TECImageMenu;
    ImageList1: TImageList;
    CheckBox2: TCheckBox;
    ECSwitch51: TECSwitch;
    ECSwitch52: TECSwitch;
    ECSpinBtns1: TECSpinBtns;
    ECSpinBtns2: TECSpinBtns;
    ECSpinBtns3: TECSpinBtns;
    ECSpinBtns4: TECSpinBtns;
    ECSpinBtns5: TECSpinBtns;
    ECSpinBtns6: TECSpinBtns;
    ECSpinBtns7: TECSpinBtns;
    ECSpinBtns8: TECSpinBtns;
    ECSpinBtns9: TECSpinBtns;
    ECSpinBtns10: TECSpinBtns;
    ECSpinBtns11: TECSpinBtns;
    ECSpinBtns12: TECSpinBtns;
    ECSpinEdit1: TECSpinEdit;
    ECSpinEdit2: TECSpinEdit;
    ECSpinEdit3: TECSpinEdit;
    ECSpinEdit4: TECSpinEdit;
    ECSpinEdit5: TECSpinEdit;
    ECSpinEdit6: TECSpinEdit;
    ECSpinEdit7: TECSpinEdit;
    ECSpinEdit8: TECSpinEdit;
    ECSpinEdit9: TECSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ECSpinBtns13: TECSpinBtns;
    ECSpinBtns14: TECSpinBtns;
    ECSpinBtns15: TECSpinBtns;
    ECSpinBtns16: TECSpinBtns;
    ECSpinBtns17: TECSpinBtns;
    ECSpinBtns18: TECSpinBtns;
    ECSpinEdit10: TECSpinEdit;
    ECSpinEdit11: TECSpinEdit;
    Label11: TLabel;
    Label12: TLabel;
    ECSpinEdit12: TECSpinEdit;
    ECSpinEdit13: TECSpinEdit;
    ECSpinEdit14: TECSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ECSpinBtns19: TECSpinBtns;
    Label17: TLabel;
    ECSpinBtns20: TECSpinBtns;
    Label18: TLabel;
    ECSpinEdit15: TECSpinEdit;
    Label19: TLabel;
    ImageList2: TImageList;
    ECSpinBtns21: TECSpinBtns;
    Label20: TLabel;
    ECSpinBtns22: TECSpinBtns;
    Label21: TLabel;
    ECSpinController1: TECSpinController;
    TIPropertyGrid1: TTIPropertyGrid;
    ECSpinEdit16: TECSpinEdit;
    ECSpinEdit17: TECSpinEdit;
    ECSpinBtns23: TECSpinBtns;
    ECSpinBtns24: TECSpinBtns;
    Memo1: TMemo;
    ECSpeedBtn1: TECSpeedBtn;
    ECSpeedBtn2: TECSpeedBtn;
    ECSpeedBtn3: TECSpeedBtn;
    ECSpeedBtn4: TECSpeedBtn;
    ECCombo1: TECComboBtn;
    ECSpeedBtn5: TECSpeedBtn;
    ECSpeedBtn6: TECSpeedBtn;
    ECSpeedBtn7: TECSpeedBtn;
    ECSpeedBtn8: TECSpeedBtn;
    ECSpeedBtn9: TECSpeedBtn;
    ECSpeedBtn10: TECSpeedBtn;
    ECSpeedBtn11: TECSpeedBtn;
    ECSpeedBtn12: TECSpeedBtn;
    ECSpeedBtn13: TECSpeedBtn;
    ECSpeedBtn14: TECSpeedBtn;
    Label22: TLabel;
    Label23: TLabel;
    ECSpeedBtn15: TECSpeedBtn;
    ECSpeedBtn16: TECSpeedBtn;
    ECSpeedBtn17: TECSpeedBtn;
    ECSpeedBtn18: TECSpeedBtn;
    ECSpeedBtn19: TECSpeedBtn;
    ECSpeedBtn20: TECSpeedBtn;
    ECSpeedBtn21: TECSpeedBtn;
    ECSpeedBtn22: TECSpeedBtn;
    ECColorBtn1: TECColorBtn;
    ECColorBtn2: TECColorBtn;
    ECColorBtn3: TECColorBtn;
    ECColorBtn4: TECColorBtn;
    ECColorBtn5: TECColorBtn;
    TabSheet7: TTabSheet;
    ECSlider14: TECSlider;
    ECSlider15: TECSlider;
    ECSlider16: TECSlider;
    ECSlider17: TECSlider;
    ECSlider18: TECSlider;
    ECSlider19: TECSlider;
    ECSlider20: TECSlider;
    ECSlider21: TECSlider;
    ECSlider22: TECSlider;
    ECSlider23: TECSlider;
    ECSlider24: TECSlider;
    ECSlider25: TECSlider;
    ECSlider26: TECSlider;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    PaintBox2: TPaintBox;
    TabSheet8: TTabSheet;
    ECSpeedBtn23: TECSpeedBtn;
    ECSpeedBtn24: TECSpeedBtn;
    ECSpeedBtn25: TECSpeedBtn;
    ECSpeedBtn26: TECSpeedBtn;
    ECSpeedBtn27: TECSpeedBtn;
    ECSpeedBtn28: TECSpeedBtn;
    ECSpeedBtn29: TECSpeedBtn;
    ECSpeedBtn30: TECSpeedBtn;
    Label27: TLabel;
    ECPositionBar1: TECPositionBar;
    ECPositionBar2: TECPositionBar;
    ECPositionBar3: TECPositionBar;
    PaintBox3: TPaintBox;
    ECPositionBar4: TECPositionBar;
    ECPositionBar5: TECPositionBar;
    ECPositionBar6: TECPositionBar;
    PaintBox4: TPaintBox;
    ECPositionBar7: TECPositionBar;
    ECPositionBar8: TECPositionBar;
    ECPositionBar9: TECPositionBar;
    PaintBox5: TPaintBox;
    ECPositionBar10: TECPositionBar;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    ECSlider27: TECSlider;
    ECSlider28: TECSlider;
    ECSlider29: TECSlider;
    ECSlider30: TECSlider;
    Label31: TLabel;
    Label32: TLabel;
    ECRuler1: TECRuler;
    ECRuler2: TECRuler;
    Image1: TImage;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    ECCombo2: TECComboBtn;
    Label37: TLabel;
    ColorButton1: TColorButton;
    ECSpeedBtn31: TECSpeedBtn;
    Label38: TLabel;
    CheckBox3: TCheckBox;
    ECPositionBar11: TECPositionBar;
    ECProgressBar1: TECProgressBar;
    Label39: TLabel;
    ECSpinEdit18: TECSpinEdit;
    Timer1: TTimer;
    ECPositionBar12: TECPositionBar;
    ECPositionBar13: TECPositionBar;
    ECPositionBar14: TECPositionBar;
    Label40: TLabel;
    ECProgressBar2: TECProgressBar;
    ECPositionBar15: TECPositionBar;
    ECPositionBar16: TECPositionBar;
    ECProgressBar3: TECProgressBar;
    ECPositionBar17: TECPositionBar;
    ECPositionBar18: TECPositionBar;
    ECPositionBar19: TECPositionBar;
    ECPositionBar20: TECPositionBar;
    ECPositionBar21: TECPositionBar;
    ECPositionBar22: TECPositionBar;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    ECPositionBar23: TECPositionBar;
    Label46: TLabel;
    ECPositionBar24: TECPositionBar;
    ECSlider31: TECSlider;
    ECSlider32: TECSlider;
    ECRuler3: TECRuler;
    ECRuler4: TECRuler;
    Image2: TImage;
    ECRuler5: TECRuler;
    Label47: TLabel;
    TabSheet9: TTabSheet;
    Memo2: TMemo;
    ECCheckGroup1: TECCheckGroup;
    ILFontStyles: TImageList;
    ECRadioGroup1: TECRadioGroup;
    ECCheckGroup2: TECCheckGroup;
    ECRadioGroup2: TECRadioGroup;
    ECCheckGroup3: TECCheckGroup;
    Label48: TLabel;
    ECRadioGroup3: TECRadioGroup;
    ECCheckGroup4: TECCheckGroup;
    ECRadioGroup4: TECRadioGroup;
    ECRadioGroup5: TECRadioGroup;
    ECCheckGroup5: TECCheckGroup;
    Panel2: TPanel;
    ECRuler6: TECRuler;
    PaintBox6: TPaintBox;
    ECCheckGroup6: TECCheckGroup;
    ECRadioGroup6: TECRadioGroup;
    ECRadioGroup7: TECRadioGroup;
    ECRadioGroup8: TECRadioGroup;
    ECCheckGroup7: TECCheckGroup;
    RadioGroup2: TRadioGroup;
    ECSpinEdit19: TECSpinEdit;
    Label49: TLabel;
    ECSpeedBtn32: TECSpeedBtn;
    ECSpeedBtn33: TECSpeedBtn;
    ECSpeedBtn34: TECSpeedBtn;
    ECSpeedBtn35: TECSpeedBtn;
    ECSpeedBtn36: TECSpeedBtn;
    Label50: TLabel;
    Label51: TLabel;
    ECSpeedBtn37: TECSpeedBtn;
    ECSpeedBtn38: TECSpeedBtn;
    ECSpeedBtn39: TECSpeedBtn;
    ECSpeedBtn40: TECSpeedBtn;
    ECSpeedBtn41: TECSpeedBtn;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    TabSheet10: TTabSheet;
    ECColorCombo1: TECColorCombo;
    Label57: TLabel;
    ECColorCombo2: TECColorCombo;
    Label58: TLabel;
    ECColorCombo3: TECColorCombo;
    Label59: TLabel;
    ECColorCombo4: TECColorCombo;
    Label60: TLabel;
    ECColorCombo5: TECColorCombo;
    Label61: TLabel;
    ECColorCombo6: TECColorCombo;
    Label62: TLabel;
    ECColorCombo7: TECColorCombo;
    Label63: TLabel;
    ECColorCombo8: TECColorCombo;
    Label64: TLabel;
    ECColorCombo9: TECColorCombo;
    Label65: TLabel;
    TabSheet11: TTabSheet;
    ECRuler7: TECRuler;
    ECRuler8: TECRuler;
    ECRuler9: TECRuler;
    ECRuler10: TECRuler;
    ECRuler11: TECRuler;
    ECRuler12: TECRuler;
    ECRuler13: TECRuler;
    ECRuler14: TECRuler;
    ECRuler15: TECRuler;
    ECRuler16: TECRuler;
    ECRuler17: TECRuler;
    ECRuler18: TECRuler;
    ECRuler19: TECRuler;
    ECRuler20: TECRuler;
    ECRuler21: TECRuler;
    ECRuler22: TECRuler;
    ECRuler23: TECRuler;
    ECRuler24: TECRuler;
    ECRuler25: TECRuler;
    ECRuler26: TECRuler;
    ECRuler27: TECRuler;
    ECRuler28: TECRuler;
    ECRuler29: TECRuler;
    ECRuler30: TECRuler;
    ECRuler31: TECRuler;
    ECRuler32: TECRuler;
    ECRuler33: TECRuler;
    ECRuler34: TECRuler;
    Memo3: TMemo;
    ECColorBtn6: TECColorBtn;
    ECColorBtn7: TECColorBtn;
    ECColorBtn8: TECColorBtn;
    ECColorBtn9: TECColorBtn;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    ECImageMenu2: TECImageMenu;
    Label70: TLabel;
    TabSheet12: TTabSheet;
    StringGrid1: TStringGrid;
    ECSpinEdit20: TECSpinEdit;
    ECCheckGroup8: TECCheckGroup;
    ECRadioGroup9: TECRadioGroup;
    ECColorBtn10: TECColorBtn;
    ECComboBtn1: TECComboBtn;
    TabSheet13: TTabSheet;
    ECSpinEdit21: TECSpinEdit;
    ECEditBtn1: TECEditBtn;
    ECColorCombo10: TECColorCombo;
    ECSpinEdit22: TECSpinEdit;
    ECEditBtn2: TECEditBtn;
    ECColorCombo11: TECColorCombo;
    Panel3: TPanel;
    ECSpinEdit23: TECSpinEdit;
    ECEditBtn3: TECEditBtn;
    ECColorCombo12: TECColorCombo;
    ECSpinEdit24: TECSpinEdit;
    ECEditBtn4: TECEditBtn;
    ECColorCombo13: TECColorCombo;
    ECSpinEdit25: TECSpinEdit;
    ECEditBtn5: TECEditBtn;
    ECColorCombo14: TECColorCombo;
    ECSpinEdit26: TECSpinEdit;
    ECEditBtn6: TECEditBtn;
    ECColorCombo15: TECColorCombo;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    ECSpinEdit27: TECSpinEdit;
    ECEditBtn7: TECEditBtn;
    ECColorCombo16: TECColorCombo;
    ECSpinEdit28: TECSpinEdit;
    ECEditBtn8: TECEditBtn;
    ECColorCombo17: TECColorCombo;
    ECSpinEdit29: TECSpinEdit;
    Label71: TLabel;
    ECEditBtn9: TECEditBtn;
    PageControl2: TPageControl;
    TabSheet14: TTabSheet;
    ECSpinEdit30: TECSpinEdit;
    ECEditBtn10: TECEditBtn;
    ECColorCombo18: TECColorCombo;
    GroupBox2: TGroupBox;
    ECSpinEdit31: TECSpinEdit;
    ECEditBtn11: TECEditBtn;
    ECColorCombo19: TECColorCombo;
    ECColorCombo20: TECColorCombo;
    ECEditBtn12: TECEditBtn;
    ECSpinEdit32: TECSpinEdit;
    ECSpinEdit33: TECSpinEdit;
    ECEditBtn13: TECEditBtn;
    ECColorCombo21: TECColorCombo;
    ECColorCombo22: TECColorCombo;
    ECColorCombo23: TECColorCombo;
    ECColorCombo24: TECColorCombo;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    ECSlider33: TECSlider;
    Label75: TLabel;
    SpinEdit1: TSpinEdit;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    ECSpinEdit35: TECSpinEdit;
    Label79: TLabel;
    procedure ECLink1Click(Sender: TObject);
    procedure ECSpeedBtn43HoldDown(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure ECSlider10Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ECSlider24DrawProgressBMP(Sender: TObject; AProgress: TBitmap);
    procedure ECSlider24Change(Sender: TObject);
    procedure ECSlider26DrawProgressBMP(Sender: TObject; AProgress: TBitmap);
    procedure ECSlider25Change(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure ECPositionBar3Change(Sender: TObject);
    procedure PaintBox3Paint(Sender: TObject);
    procedure ECSlider29Change(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ECPositionBar9Change(Sender: TObject);
    procedure PaintBox5Paint(Sender: TObject);
    procedure ECPositionBar4Change(Sender: TObject);
    procedure PaintBox4Paint(Sender: TObject);
    procedure ECPositionBar4DrawProgressBMP(Sender: TObject; AProgress: TBitmap);
    procedure ECPositionBar6Change(Sender: TObject);
    procedure ECSpeedBtn14Release(Sender: TObject);
    procedure ECCombo2Change(Sender: TObject);
    procedure ColorButton1ColorChanged(Sender: TObject);
    procedure ECSpeedBtn31DrawGlyph(Sender: TObject; AState: TItemState);
    procedure CheckBox3Change(Sender: TObject);
    procedure ECSpinEdit18Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ECComboSpeedBtnClick(Sender: TObject);
    procedure ECCheckGroup1ItemClick(Sender: TObject; Index: integer);
    procedure PaintBox6Paint(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure StringGrid1SelectEditor(Sender: TObject; aCol, aRow: Integer; var Editor: TWinControl);
    procedure ECSpinEdit20KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ECSpinEdit20EditingDone(Sender: TObject);
    procedure ECComboBtn1EditingDone(Sender: TObject);
    procedure ECColorBtn10EditingDone(Sender: TObject);
    procedure ECEditBtn9EditingDone(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, 
      Y: Integer);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { private declarations }
    function GetHue(Sender: TBaseECSlider): TColor;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  PaintBox1.Canvas.Brush.Color:=RGBToColor(round(ECSlider10.Position), round(ECSlider11.Position),
                                           round(ECSlider12.Position));
  PaintBox1.Canvas.FillRect(PaintBox1.ClientRect);
end;

procedure TForm1.ECSlider10Change(Sender: TObject);
begin
  PaintBox1.Invalidate;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
var b: Boolean;
begin
  b:=(Sender as TCheckBox).Checked;
  ECImageMenu1.Enabled:=b;
  ECImageMenu2.Enabled:=b;
  Image1.Enabled:=b;
  Image2.Enabled:=b;
  ECRuler1.Enabled:=b;
  ECRuler2.Enabled:=b;
  ECRuler3.Enabled:=b;
  ECRuler4.Enabled:=b;
  ECRuler5.Enabled:=b;
end;
                                             					
procedure TForm1.FormCreate(Sender: TObject);
var j: Integer;
begin
  for j:=StringGrid1.FixedRows to StringGrid1.RowCount-1 do
    begin
      StringGrid1.Cells[0, j]:=inttostr(j);
      StringGrid1.Cells[3, j]:='$0000'+hexStr(10*j, 2);
      StringGrid1.Cells[5, j]:=inttostr(100-j);
    end;
  ECSpinEdit7.Buttons.Max:=Now+365;
  ECSpinEdit7.Buttons.Min:=Now-365;
  ECSpinEdit35.Buttons.Max:=Now+20*365;
  ECSpinEdit35.Buttons.Min:=Now-20*365;     
  ECSpinEdit7.Buttons.Value:=Now;
  ECSpinEdit35.Buttons.Value:=Now;
  ECSpinEdit7.Buttons.Middle:=ECSpinEdit7.Buttons.Value;
  ECSpinEdit35.Buttons.Middle:=ECSpinEdit35.Buttons.Value;
  ECSpinEdit8.Buttons.Value:=Time;
  ECSpinEdit8.Buttons.Increment:=1/(24*60);
  ECSpinEdit8.Buttons.MouseIncrementY:=ECSpinEdit8.Buttons.Increment;
  ECSpinEdit8.Buttons.PageSize:=1/24;
  TIPropertyGrid1.TIObject:=ECSpinController1;
  ECRuler2.IndentTopLeft:=ECRuler1.Width;
  ECRuler4.IndentTopLeft:=ECRuler3.Width;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(Image1.ClientRect);
  Image2.Canvas.Brush.Color:=clWhite;
  Image2.Canvas.Pen.Color:=clMaroon;
  Image2.Canvas.FillRect(Image1.ClientRect);  
  ECRuler1.Max:=Image1.Height;
  ECRuler2.Max:=Image1.Width;
  ECRuler3.Max:=Image2.Height;
  ECRuler4.Max:=Image2.Width;     
  ECSlider24Change(ECSlider24);
  ECPositionBar6Change(ECPositionBar6);
  ECProgressBar3.BiDiMode:=bdRightToLeft;
end;

procedure TForm1.ECSlider24DrawProgressBMP(Sender: TObject; AProgress: TBitmap);
var aRect_6: TRect;
    aWidth: Integer;
begin
  with Sender as TBaseECSlider do   
    begin      
      aWidth:=AProgress.Width;
      aRect_6:=Rect(0, 0, aWidth div 6, AProgress.Height);
      AProgress.Canvas.GradientFill(aRect_6, clAqua, clBlue, gdHorizontal);  
      aRect_6.Left:=aRect_6.Right;
      aRect_6.Right:=aWidth div 3;
      AProgress.Canvas.GradientFill(aRect_6, clBlue, clFuchsia, gdHorizontal);
      aRect_6.Left:=aRect_6.Right;
      aRect_6.Right:=aWidth div 2;
      AProgress.Canvas.GradientFill(aRect_6, clFuchsia, clRed, gdHorizontal);
      aRect_6.Left:=aRect_6.Right;
      aRect_6.Right:=2*aWidth div 3;
      AProgress.Canvas.GradientFill(aRect_6, clRed, clYellow, gdHorizontal);
      aRect_6.Left:=aRect_6.Right;
      aRect_6.Right:=5*aWidth div 6;
      AProgress.Canvas.GradientFill(aRect_6, clYellow, clLime, gdHorizontal);       
      aRect_6.Left:=aRect_6.Right;
      aRect_6.Right:=aWidth;
      AProgress.Canvas.GradientFill(aRect_6, clLime, clAqua, gdHorizontal);      
    end;        
end;

procedure TForm1.ECSlider24Change(Sender: TObject);
begin
  ECSlider26.Redraw;
  ECSlider25.ProgressColor2:=GetHue(ECSlider24);  
  PaintBox2.Invalidate;
end;

procedure TForm1.ECSlider26DrawProgressBMP(Sender: TObject; AProgress: TBitmap);
var aRect_2: TRect;
    aWidth: Integer;
    aHue: TColor;
begin
  with Sender as TBaseECSlider do
    begin
      aHue:=GetHue(ECSlider24);
      aWidth:=AProgress.Width;
      aRect_2:=Rect(0, 0, aWidth div 2, AProgress.Height);
      AProgress.Canvas.GradientFill(aRect_2, clBlack, aHue, gdHorizontal);
      aRect_2.Left:=aRect_2.Right;
      aRect_2.Right:=aWidth;
      AProgress.Canvas.GradientFill(aRect_2, aHue, clWhite, gdHorizontal);  
    end;           
end;

function TForm1.GetHue(Sender: TBaseECSlider): TColor;
var d: Double;
    r, g, b: Byte;
begin
  d:=Sender.Position;
  r:=0;
  if (d>50) and (d<=100) then
    begin
      r:=trunc(255*(d-50)/50);
    end else
    if (d>100) and (d<=200) then
      begin
        r:=255;
      end else
      if (d>200) and (d<=250) then
        begin
          r:=trunc(255*(250-d)/50);
        end;
  b:=0;
  if (d<=100) then b:=255
    else
    if (d>100) and (d<=150) then
      begin
        b:=trunc(255*(150-d)/50);
      end else
      if (d>250) then
        begin
          b:=trunc(255*(d-250)/50);
        end;
  g:=0;
  if (d<=50) then
    begin
      g:=trunc(255*(50-d)/50);
    end else
    if (d>150) and (d<=200) then
      begin
        g:=trunc(255*(d-150)/50);
      end else
      if (d>200) then g:=255;
  Result:=RGBToColor(r, g, b);
end;

procedure TForm1.ECSlider25Change(Sender: TObject);
begin
  PaintBox2.Invalidate;
end;

procedure TForm1.PaintBox2Paint(Sender: TObject);
var aColor: TColor;
    r,g,b: Byte;
    d: Double;   
    i: Integer;
begin
  aColor:=GetHue(ECSlider24);
  RedGreenBlue(aColor, r, g, b);
  with PaintBox2.Canvas do
    begin
      i:=(r+g+b) div 3;
      d:=ECSlider25.Position/100;
      r:=round(r*d+i*(1-d));
      g:=round(g*d+i*(1-d));
      b:=round(b*d+i*(1-d));
      d:=ECSlider26.Position;
      if d<50 then
        begin
          r:=round(r*d/50);
          g:=round(g*d/50);
          b:=round(b*d/50);
        end else
        begin
          d:=(d-50)/50;
          r:=round(d*255+r*(1-d));
          g:=round(d*255+g*(1-d));
          b:=round(d*255+b*(1-d));
        end;
      aColor:=RGBToColor(r,g,b	);
      Brush.Color:=aColor;
      FillRect(0, 0, Width, Height);
    end;
end;

procedure TForm1.ECPositionBar3Change(Sender: TObject);
begin
  PaintBox3.Invalidate;
end;

procedure TForm1.PaintBox3Paint(Sender: TObject);
begin
  PaintBox3.Canvas.Brush.Color:=RGBToColor(round(ECPositionBar1.Position), round(ECPositionBar2.Position),
                                           round(ECPositionBar3.Position));
  PaintBox3.Canvas.FillRect(PaintBox3.ClientRect);     
end;

procedure TForm1.ECSlider29Change(Sender: TObject);
begin
  Label82.Caption:='Logarithmic Position: '+floattostrF(ECSlider29.LogarithmicPosition, ffFixed, 0, 3);
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ECRuler1.Position:=(Sender as TImage).Height-Y;
  ECRuler2.Position:=X;
  if ssLeft in Shift then Image1.Canvas.Pixels[X, Y]:=clBlack;
end;

procedure TForm1.ECPositionBar9Change(Sender: TObject);
begin
  PaintBox5.Invalidate;
end;

procedure TForm1.PaintBox5Paint(Sender: TObject);
var C, M, Y, K: Double;
    R, G, B: Byte;
begin
  with (Sender as TPaintBox).Canvas do
    begin
      K:=ECPositionBar10.Position/255;
      C:=(ECPositionBar9.Position/255)*(1-K)+K; 
 			M:=(ECPositionBar8.Position/255)*(1-K)+K;
 	 		Y:=(ECPositionBar7.Position/255)*(1-K)+K;
      R:=round((1-C)*255); 
 			G:=round((1-M)*255); 
 			B:=round((1-Y)*255);
      Brush.Color:=RGBToColor(R, G, B);
      FillRect((Sender as TPaintBox).ClientRect);
    end;
end;

procedure TForm1.PaintBox6Paint(Sender: TObject);
begin
  with (Sender as TPaintBox) do
    begin
      Canvas.GradientFill(ClientRect, clRed, clYellow, gdHorizontal);
    end;
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
begin
  ECImageMenu1.Layout:=TObjectPos((Sender as TRadioGroup).ItemIndex);
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  ECImageMenu1.CaptionAlign:=(Sender as TSpinEdit).Value;
end;

procedure TForm1.StringGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, 
  Y: Integer);
begin
  {Hide editor on Column sizing; it's ugly without this}
  if Y<StringGrid1.DefaultRowHeight then StringGrid1.Editor.Visible:=False;
end;

procedure TForm1.StringGrid1SelectEditor(Sender: TObject; aCol, aRow: Integer; 
  var Editor: TWinControl);
var aRect: TRect;
    aText: string;
begin
  if aRow=0 then exit;
  aRect:=(Sender as TStringGrid).CellRect(aCol, aRow);
  aText:=(Sender as TStringGrid).Cells[aCol, aRow];
  dec(aRect.Right);
  dec(aRect.Bottom);
  case aCol of
    0: begin
        ECSpinEdit20.SetRealBoundRect(aRect);
        Editor:=ECSpinEdit20;
        ECSpinEdit20.Text:=aText;
      end;
    1: begin
        ECCheckGroup8.BoundsRect:=aRect;
        Editor:=ECCheckGroup8;
      end;   
    2: begin
        ECRadioGroup9.BoundsRect:=aRect;
        Editor:=ECRadioGroup9;
      end;      
    3: begin
        ECColorBtn10.SetRealBoundRect(aRect);
        Editor:=ECColorBtn10;
        ECColorBtn10.Text:=aText;
        ECColorBtn10.EditingDone;
      end;      
    4: begin
        ECComboBtn1.SetRealBoundRect(aRect);
        Editor:=ECComboBtn1;
        ECComboBtn1.Text:=aText;
      end;   
    5: begin
        ECSpinEdit29.SetRealBoundRect(aRect);
        Editor:=ECSpinEdit29;
        ECSpinEdit29.Text:=aText;
      end;         
    6: begin
        ECEditBtn9.SetRealBoundRect(aRect);
        Editor:=ECEditBtn9;
        ECEditBtn9.Text:=aText;
      end;      
  end;
end;

procedure TForm1.ECPositionBar4Change(Sender: TObject);
begin
  PaintBox4.Invalidate;
end;

procedure TForm1.PaintBox4Paint(Sender: TObject);
var aColor: TColor;
    r,g,b: Byte;
    d: Double;   
    i: Integer;
begin
  aColor:=GetHue(ECPositionBar6);
  RedGreenBlue(aColor, r, g, b);
  with PaintBox4.Canvas do
    begin
      i:=(r+g+b) div 3;
      d:=ECPositionBar5.Position/100;
      r:=round(r*d+i*(1-d));
      g:=round(g*d+i*(1-d));
      b:=round(b*d+i*(1-d));
      d:=ECPositionBar4.Position;
      if d<50 then
        begin
          r:=round(r*d/50);
          g:=round(g*d/50);
          b:=round(b*d/50);
        end else
        begin
          d:=(d-50)/50;
          r:=round(d*255+r*(1-d));
          g:=round(d*255+g*(1-d));
          b:=round(d*255+b*(1-d));
        end;
      aColor:=RGBToColor(r,g,b);
      Brush.Color:=aColor;
      FillRect(0, 0, Width, Height);
    end;             
end;

procedure TForm1.ECPositionBar4DrawProgressBMP(Sender: TObject; AProgress: TBitmap);
var aRect_2: TRect;
    aWidth: Integer;
    aHue: TColor;
begin
  with Sender as TBaseECSlider do
    begin
      aHue:=GetHue(ECPositionBar6);
      aWidth:=AProgress.Width;
      aRect_2:=Rect(0, 0, aWidth div 2, AProgress.Height);
      AProgress.Canvas.GradientFill(aRect_2, clBlack, aHue, gdHorizontal);
      aRect_2.Left:=aRect_2.Right;
      aRect_2.Right:=aWidth;
      AProgress.Canvas.GradientFill(aRect_2, aHue, clWhite, gdHorizontal);  
    end; 
end;

procedure TForm1.ECPositionBar6Change(Sender: TObject);
begin
  ECPositionBar4.Redraw;
  ECPositionBar4.Invalidate;
  ECPositionBar5.ProgressColor2:=GetHue(Sender as TBaseECSlider);  
  PaintBox4.Invalidate;
end;

procedure TForm1.ECSpeedBtn14Release(Sender: TObject);
begin
  ShowMessage('OnRelease triggered.');
end;

procedure TForm1.ECCombo2Change(Sender: TObject);
begin
  with Sender as TECComboBtn do
    Button.GlyphDesign:=TGlyphDesign(ItemIndex);
end;

procedure TForm1.ECComboBtn1EditingDone(Sender: TObject);
var aText: string;
begin
  with StringGrid1 do
    begin
      aText:=(Sender as TECComboBtn).Text;
      if aText<>'' then (Sender as TECComboBtn).AddItemHistory(aText, True);
      Cells[Col, Row]:=aText;
    end;
end;

procedure TForm1.ColorButton1ColorChanged(Sender: TObject);
begin
  with Sender as TColorButton do
    ECCombo2.Button.GlyphColor:=ButtonColor; 
end;

procedure TForm1.ECCheckGroup1ItemClick(Sender: TObject; Index: integer);
var aStyle: TFontStyles;
begin
  aStyle:=[];
  if (Sender as TECCheckGroup).Items[0].Checked then include(aStyle, fsBold);
  if (Sender as TECCheckGroup).Items[1].Checked then include(aStyle, fsItalic);
  if (Sender as TECCheckGroup).Items[2].Checked then include(aStyle, fsUnderline);
  Memo2.Font.Style:=aStyle;
end;

procedure TForm1.ECColorBtn10EditingDone(Sender: TObject);
var aText: string;
begin
  with StringGrid1 do
    begin
      aText:=(Sender as TECColorBtn).Text;
      Cells[Col, Row]:=aText;
    end;        
end;

procedure TForm1.ECSpeedBtn31DrawGlyph(Sender: TObject; AState: TItemState);
begin
  with (Sender as TECSpeedBtn).BtnBitmaps[aState].Canvas do
    begin
      Pen.Width:=1;
      Brush.Style:=bsClear;
      case AState of
        eisDisabled: 
          begin
            Pen.Style:=psSolid;
            TextOut(12, 6, 'D'); 
            Line(5, 5, Width-5, Height-5);
          end;
        eisHighlighted: 
          begin
            Pen.Style:=psDot;
            TextOut(12, 6, 'H');
            Line(5, 5, 5, Height-5);
          end;
        eisEnabled: 
          begin
            Pen.Style:=psDash;
            TextOut(7, 6, 'E'); 
            Line(5, 5, Width-5, 5);
          end;
        eisPushed, eisPushedHihlighted:
          begin
            Pen.Style:=psSolid;
            TextOut(11, 5, 'P');
            Line(5, Height-5, Width-5, Height-5);                
          end;
      end;
    end;
end;

procedure TForm1.ECSpeedBtn43HoldDown(Sender: TObject);
begin
  ShowMessage('OnHoldDown triggered.');
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
  ECSpeedBtn31.Enabled:=(Sender as TCheckBox).Checked;
end;

procedure TForm1.ECSpinEdit18Change(Sender: TObject);
begin
  ECProgressBar1.Position:=(Sender as TECSpinEdit).Value;
  ECProgressBar3.Position:=(Sender as TECSpinEdit).Value;
end;

procedure TForm1.ECSpinEdit20EditingDone(Sender: TObject);
begin
  with StringGrid1 do
    Cells[Col, Row]:=(Sender as TECSpinEdit).Text;
end;

procedure TForm1.ECSpinEdit20KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var i, j: Integer;
begin
  if Key=13 then
    begin
      if [ssCtrl, ssAlt, ssShift, ssMeta]*Shift=[] then
        begin
          i:=StringGrid1.Col;
          inc(i);
          if i>=StringGrid1.ColCount then 
            begin
              i:=0;
              j:=StringGrid1.Row;
              inc(j);
              if j>=StringGrid1.RowCount then j:=StringGrid1.FixedRows;
              StringGrid1.Row:=j;
            end;
          StringGrid1.Col:=i;
        end;   
      if ssShift in Shift then
        begin
          i:=StringGrid1.Col;
          dec(i);
          if i<0 then 
            begin
              i:=StringGrid1.ColCount-1;
              j:=StringGrid1.Row;
              dec(j);
              if j<StringGrid1.FixedRows then j:=StringGrid1.RowCount-1;
              StringGrid1.Row:=j;
            end;
          StringGrid1.Col:=i;
        end;         
    end;
  if ssCtrl in Shift then
    begin
      case Key of
        VK_UP: 
          begin
            StringGrid1.Row:=max(StringGrid1.Row-1, StringGrid1.FixedRows);
          end;
        VK_DOWN:
          begin
            StringGrid1.Row:=min(StringGrid1.Row+1, StringGrid1.RowCount-1);
          end;
        VK_LEFT: 
          begin
            StringGrid1.Col:=max(StringGrid1.Col-1, StringGrid1.FixedCols);
          end;
        VK_RIGHT: 
          begin
            StringGrid1.Col:=min(StringGrid1.Col+1, StringGrid1.ColCount-1);
          end;
        VK_HOME: 
          begin
            StringGrid1.Row:=StringGrid1.FixedRows;
          end;
        VK_END:
          begin
            StringGrid1.Row:=StringGrid1.RowCount-1;
          end;
        VK_PRIOR: 
          begin
            StringGrid1.Row:=max(StringGrid1.Row-StringGrid1.VisibleRowCount, StringGrid1.FixedRows);
          end;
        VK_NEXT:
          begin
            StringGrid1.Row:=min(StringGrid1.Row+StringGrid1.VisibleRowCount, StringGrid1.RowCount-1);
          end;       
      end;
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i: Integer;											 
begin
  i:=round(ECProgressBar2.Position);
  inc(i, 10);
  if i>100 then i:=0;
  ECProgressBar2.Position:=i;
end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ECRuler3.Position:=Y;
  ECRuler4.Position:=X;
  if ssLeft in Shift then Image2.Canvas.LineTo(X, Y);    
end;

procedure TForm1.ECComboSpeedBtnClick(Sender: TObject);
begin
  MessageDlg('Qwerty', mtInformation, [mbOK], 0);
end;

procedure TForm1.ECEditBtn9EditingDone(Sender: TObject);
begin
  with StringGrid1 do
    Cells[Col, Row]:=(Sender as TECEditBtn).Text;  
end;

procedure TForm1.ECLink1Click(Sender: TObject);
begin
  ShowMessage(TControl(Sender).Name+'.OnClick');
end;

end.

