unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Menus, ATButtons, ATFlatToolbar;

type
  { TfmMain }

  TfmMain = class(TForm)
    chkEn: TCheckBox;
    chkFocus: TCheckBox;
    ImageList1: TImageList;
    Label1: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    PanelRight: TPanel;
    PanelToolbar: TPanel;
    PopupMenu1: TPopupMenu;
    procedure chkEnChange(Sender: TObject);
    procedure chkFocusChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    procedure BtnToggleClick(Sender: TObject);
    procedure BtnColorsClick(Sender: TObject);
    procedure BtnChoiceClick(Sender: TObject);
  public
    { public declarations }
    b, b2, b3, b_choice, b_colors: TATButton;
    bar, bar2: TATFlatToolbar;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.lfm}

{ TfmMain }

procedure TfmMain.FormCreate(Sender: TObject);
var
  bmp: TBitmap;
  fn: string;
  List: TStringList;
begin
  List:= TStringList.Create;
  List.Add('item-a');
  List.Add('item-bb');
  List.Add('item-cccc');
  List.Add('item-ddddddd');

  bmp:= TBitmap.Create;
  fn:= ExtractFilepath(Application.Exename)+'bmp1.bmp';
  if FileExists(fn) then
    bmp.LoadFromFile(fn);

  b:= TATButton.create(self);
  b.parent:= self;
  b.SetBounds(50, 140, 180, 40);
  b.Caption:= 'Toggle checks';
  b.OnClick:= @BtnToggleClick;

  b2:= TATButton.create(self);
  b2.parent:= self;
  b2.SetBounds(50, 190, 80, 30);
  b2.Caption:= 'Check1';
  b2.Checkable:= true;

  b3:= TATButton.create(self);
  b3.parent:= self;
  b3.SetBounds(130, 190, 80, 30);
  b3.Caption:= 'Check2';
  b3.Checkable:= true;

  b_choice:= TATButton.create(self);
  b_choice.parent:= self;
  b_choice.SetBounds(210, 190, 100, 30);
  b_choice.Caption:= '_________';
  b_choice.Kind:= abuTextChoice;
  b_choice.Arrow:= true;
  b_choice.Focusable:= false;
  b_choice.Items.Add('item-a');
  b_choice.Items.Add('item-b');
  b_choice.Items.Add('item-c');
  b_choice.ItemIndex:= 1;

  b_colors:= TATButton.create(self);
  b_colors.parent:= self;
  b_colors.SetBounds(120, 240, 100, 50);
  b_colors.Caption:= 'change';
  b_colors.Picture.Assign(bmp);
  b_colors.Kind:= abuTextIconVert;
  b_colors.OnClick:= @BtnColorsClick;
  b_colors.BoldFont:= true;

  bar:= TATFlatToolbar.create(self);
  bar.Parent:= PanelToolbar;
  bar.SetBounds(4, 30, 400, 60);
  bar.Images:= ImageList1;
  bar.AddButton(0, @BtnColorsClick, 'Open', 'hint1', '', true);
  bar.AddDropdown(-1, PopupMenu1, nil, '', 'Some menu');
  bar.AddDropdown(-1, PopupMenu1, nil, 'Sub:', 'Does same as btn before');
  bar.AddButton(1, @BtnColorsClick, '', 'hint2', '', false);
  bar.AddSep;
  bar.AddButton(2, @BtnColorsClick, '', 'hint3', '', false);
  //bar.AddButton(-1, nil, 'Cap', 'hint4', '', true);
  bar.AddChoice(@BtnChoiceClick, 80, List, 0, 'choice combo', '');

  bar2:= TATFlatToolbar.create(self);
  bar2.Parent:= PanelRight;
  bar2.Align:= alClient;
  bar2.Vertical:= true;
  bar2.Images:= ImageList1;
  bar2.AddButton(0, @BtnColorsClick, 'Open', 'hint1', '', true);
  bar2.AddDropdown(-1, PopupMenu1, nil, '', 'Some menu');
  bar2.AddDropdown(-1, PopupMenu1, nil, 'Sub:', 'Does same as btn before');
  bar2.AddButton(1, @BtnColorsClick, '', 'hint2', '', false);
  bar2.AddSep;
  bar2.AddButton(2, @BtnColorsClick, '', 'hint3', '', false);
  bar2.AddButton(-1, nil, 'Cap', 'hint4', '', true);
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  bar.UpdateControls;
  bar2.UpdateControls;
end;

procedure TfmMain.chkFocusChange(Sender: TObject);
var
  en: boolean;
begin
  en:= chkFocus.Checked;
  b.Focusable:= en;
  b_colors.Focusable:= en;
  b2.Focusable:= en;
  b3.Focusable:= en;
end;

procedure TfmMain.chkEnChange(Sender: TObject);
var
  en: boolean;
begin
  en:= chkEn.Checked;
  b.Enabled:= en;
  b_colors.Enabled:= en;
  b2.Enabled:= en;
  b3.Enabled:= en;
end;

procedure TfmMain.BtnToggleClick(Sender: TObject);
begin
  with b2 do Checked:= not Checked;
  with b3 do Checked:= not Checked;
end;

procedure TfmMain.BtnColorsClick(Sender: TObject);
  function SomeColor: TColor;
  begin
    Result:= $a00000+Random($fffff);
  end;
begin
  with ATButtonTheme do
  begin
    ColorFont:= SomeColor;
    ColorBgPassive:= SomeColor;
    ColorBgOver:= SomeColor;
    ColorBgChecked:= SomeColor;
  end;
  Invalidate;
end;

procedure TfmMain.BtnChoiceClick(Sender: TObject);
begin
  ShowMessage('choice changed');
end;

end.

