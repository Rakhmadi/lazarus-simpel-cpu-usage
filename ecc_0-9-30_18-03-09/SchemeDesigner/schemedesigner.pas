unit SchemeDesigner;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons,
  Spin, Menus, ActnList, ECScheme, ECTypes, types, LazFileUtils;

type
  { TSchemeDsgn }
  TSchemeDsgn = class(TForm)
    AcAddDevice: TAction;
    AcDelDevice: TAction;
    AcClearAllConn: TAction;
    AcClearAllDev: TAction;
    AcClearOuts: TAction;
    AcAllAutosized: TAction;
    AcSaveToXML: TAction;
    AcAreConnected: TAction;
    AL1: TActionList;
    BBAddDev: TBitBtn;
    BBDelDev: TBitBtn;
    BBClearDev: TBitBtn;
    BBLoad: TBitBtn;
    BBSave: TBitBtn;
    BBReverseCon: TBitBtn;
    BBClearAllConn: TBitBtn;
    BBClearOuts: TBitBtn;
    BBLoadDemo: TBitBtn;
    BevBtns: TBevel;
    BBAutosize: TBitBtn;
    BBDelOut: TBitBtn;
    CBArrow: TCheckBox;
    CBNoIcon: TCheckBox;
    CBNoText: TCheckBox;
    CBLConnection: TCheckBox;
    CBLConnVertThenHor: TCheckBox;
    CGXMLFlags: TCheckGroup;
    ClrBtnBlkClr: TColorButton;
    ClrBtnBlkFntClr: TColorButton;
    CmbDevStyle: TComboBox;
    CBDash: TCheckBox;
    CBDot: TCheckBox;
    ClrBtnConClr: TColorButton;
    CGSchemeOpts: TCheckGroup;
    CBAutosized: TCheckBox;
    CBFixed: TCheckBox;
    CmbBlkStyle: TComboBox;
    CBShowGrid: TCheckBox;
    CBSnapToGrid: TCheckBox;
    CBBold: TCheckBox;
    CBImages: TCheckBox;
    ClrBtnDevClr: TColorButton;
    ClrBtnDevFntClr: TColorButton;
    CmbLayout: TComboBox;
    ECScheme: TECScheme;
    GBDev: TGroupBox;
    GBConn: TGroupBox;
    GBSchemeOpts: TGroupBox;
    GBGrid: TGroupBox;
    GBDevOpts: TGroupBox;
    GBImages: TGroupBox;
    GBDevSpec: TGroupBox;
    GBSchemeOptsEx: TGroupBox;
    GBBlockSpec: TGroupBox;
    IL1: TImageList;
    LabDev: TLabel;
    LabConn: TLabel;
    LabDevice: TLabel;
    LabCon: TLabel;
    LabCPW: TLabel;
    LabCPC: TLabel;
    LabBW: TLabel;
    LabBH: TLabel;
    LabBStyle: TLabel;
    LabCap: TLabel;
    LabColor: TLabel;
    LabBColor: TLabel;
    LabTag: TLabel;
    LabFontColor: TLabel;
    LabLayout: TLabel;
    LabMaxOut: TLabel;
    LabMaxIn: TLabel;
    LabFColor: TLabel;
    LabStyle: TLabel;
    LabFS: TLabel;
    LabImageIdx: TLabel;
    LabGrid: TLabel;
    LBDev: TListBox;
    LBConn: TListBox;
    MemCap: TMemo;
    MemDesc: TMemo;
    MIClearOut: TMenuItem;
    MIAutosize: TMenuItem;
    MIAreConnected: TMenuItem;
    MIClearOutputs: TMenuItem;
    MIClearAllConn: TMenuItem;
    MIClearDev: TMenuItem;
    MISep5: TMenuItem;
    MIAddDev: TMenuItem;
    MISep3: TMenuItem;
    MIDelDevice: TMenuItem;
    DlgOpen: TOpenDialog;
    Panel: TPanel;
    PanConn: TPanel;
    PMScheme: TPopupMenu;
    DlgSave: TSaveDialog;
    SEDevBH: TSpinEdit;
    SEDevBW: TSpinEdit;
    SECPW: TSpinEdit;
    SEGrid: TSpinEdit;
    SEImageIdx: TSpinEdit;
    SEBW: TSpinEdit;
    SEBH: TSpinEdit;
    SEFS: TSpinEdit;
    SEMaxIn: TSpinEdit;
    SEMaxOut: TSpinEdit;
    SBtnDefDevClr: TSpeedButton;
    SBtnDefDevFontClr: TSpeedButton;
    SBtnDefConClr: TSpeedButton;
    SBtnDefBlkClr: TSpeedButton;
    SBtnDefBlkFntClr: TSpeedButton;
    SETag: TSpinEdit;
    SplitterV: TSplitter;
    SplitterH: TSplitter;
    LabDevWidth: TStaticText;
    LabDevHeight: TStaticText;
    procedure AcAddDeviceExecute(Sender: TObject);
    procedure AcAllAutosizedExecute(Sender: TObject);
    procedure AcAreConnectedExecute(Sender: TObject);
    procedure AcClearAllDevExecute(Sender: TObject);
    procedure AcClearAllConnExecute(Sender: TObject);
    procedure AcClearOutsExecute(Sender: TObject);
    procedure AcDelDeviceExecute(Sender: TObject);
    procedure AcSaveToXMLExecute(Sender: TObject);
    procedure BBDelOutClick(Sender: TObject);
    procedure BBLoadClick(Sender: TObject);
    procedure BBLoadDemoClick(Sender: TObject);
    procedure BBReverseConClick(Sender: TObject);
    procedure BBSaveClick(Sender: TObject);
    procedure CBAutosizedChange(Sender: TObject);
    procedure CBLConnectionChange(Sender: TObject);
    procedure CBLConnVertThenHorChange(Sender: TObject);
    procedure CBNoIconChange(Sender: TObject);
    procedure CBNoTextChange(Sender: TObject);
    procedure ClrBtnBlkClrColorChanged(Sender: TObject);
    procedure CBBoldChange(Sender: TObject);
    procedure ClrBtnBlkFntClrColorChanged(Sender: TObject);
    procedure ClrBtnConClrColorChanged(Sender: TObject);
    procedure CBDashChange(Sender: TObject);
    procedure CBDotChange(Sender: TObject);
    procedure CBArrowChange(Sender: TObject);
    procedure CBImagesChange(Sender: TObject);
    procedure CmbBlkStyleChange(Sender: TObject);
    procedure CBFixedChange(Sender: TObject);
    procedure CBShowGridChange(Sender: TObject);
    procedure CBSnapToGridChange(Sender: TObject);
    procedure CmbLayoutChange(Sender: TObject);
    procedure CmbDevStyleChange(Sender: TObject);
    procedure CGSchemeOptsItemClick(Sender: TObject; {%H-}Index: integer);
    procedure ClrBtnDevClrColorChanged(Sender: TObject);
    procedure ClrBtnDevFntClrColorChanged(Sender: TObject);
    procedure ECSchemeContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure ECSchemeSchemeChange(Sender: TObject);
    procedure ECSchemeSelectionChange(Sender: TObject);
    procedure MemCapEditingDone(Sender: TObject);
    procedure MemDescEditingDone(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure LBConnSelectionChange(Sender: TObject; User: boolean);
    procedure LBDevSelectionChange(Sender: TObject; {%H-}User: boolean);
    procedure SBtnDefBlkClrClick(Sender: TObject);
    procedure SBtnDefBlkFntClrClick(Sender: TObject);
    procedure SBtnDefConClrClick(Sender: TObject);
    procedure SBtnDefDevClrClick(Sender: TObject);
    procedure SBtnDefDevFontClrClick(Sender: TObject);
    procedure SEBHChange(Sender: TObject);
    procedure SEBWChange(Sender: TObject);
    procedure SECPWChange(Sender: TObject);
    procedure SEDevBHChange(Sender: TObject);
    procedure SEDevBWChange(Sender: TObject);
    procedure SEFSChange(Sender: TObject);
    procedure SEGridChange(Sender: TObject);
    procedure SEImageIdxChange(Sender: TObject);
    procedure SEMaxInChange(Sender: TObject);
    procedure SEMaxOutChange(Sender: TObject);
    procedure SETagChange(Sender: TObject);
  private
    { private declarations }
    SchemeChanged: Boolean;
    procedure CGToSchemeOpts;
    procedure SchemeOptsToCG;
    function GetXMLFlags: TXMLFlags;
    procedure MIConnectionClick(Sender: TObject);
    procedure SetSchemeOptions;
  public
    { public declarations }
    Device: TECDevice;
    PConnection: PTECConnection;
    procedure DoSchemeChanged;
  end;

var
  SchemeDsgn: TSchemeDsgn;

implementation

{$R *.lfm}

{ TSchemeDsgn }

procedure TSchemeDsgn.AcAddDeviceExecute(Sender: TObject);
begin
  ECScheme.Devices.AddDevice;
end;

procedure TSchemeDsgn.AcAllAutosizedExecute(Sender: TObject);
var i: Integer;
begin
  ECScheme.Options:=ECScheme.Options-[esoIdenticalBlocks];
  for i:=0 to ECScheme.Devices.Count-1 do
    ECScheme.Devices[i].Options:=ECScheme.Devices[i].Options+[edoAutosized];
  CGSchemeOpts.Checked[0]:=False;
  LBDevSelectionChange(nil, False);
end;

procedure TSchemeDsgn.AcAreConnectedExecute(Sender: TObject);
var aCount, i: Integer;
    aSelected, aDevices: TIntegerDynArray;
    aStr: string;
begin
  ECScheme.GetAllSelected(aCount, aSelected);
  if aCount=2 then
    begin
      if ECScheme.Devices.IsConnectedIndirectly(aSelected[0], aSelected[1], aDevices) then
        begin
          aStr:='';
          for i:=0 to length(aDevices)-1 do
            aStr:=aStr+ECScheme.Devices[aDevices[i]].Caption+', ';
          MessageDlg('Devices '+ECScheme.Devices[aSelected[0]].Caption+' and '+
                     ECScheme.Devices[aSelected[1]].Caption+' are connected through: '+aStr,
                     mtInformation, [mbOk], 0);
        end else
        begin
          MessageDlg('Devices '+ECScheme.Devices[aSelected[0]].Caption+' and '+
                     ECScheme.Devices[aSelected[1]].Caption+' are not connected.',
                     mtInformation, [mbOk], 0);
        end;
    end;
end;

procedure TSchemeDsgn.AcClearAllDevExecute(Sender: TObject);
begin
  while SchemeChanged do
    case MessageDlg('Scheme changed. Save?', mtConfirmation, mbYesNoCancel, 0) of
      mrCancel: exit;  { Exit }
      mrYes: AcSaveToXML.Execute;
      mrNo: break;
    end;
  ECScheme.Devices.ClearAll;
  LBDevSelectionChange(nil, False);
  SchemeChanged:=False;
end;

procedure TSchemeDsgn.AcClearOutsExecute(Sender: TObject);
begin
  Device.ClearOutputs;
end;

procedure TSchemeDsgn.AcClearAllConnExecute(Sender: TObject);
begin
  ECScheme.Devices.ClearAllConnections;
end;

procedure TSchemeDsgn.AcDelDeviceExecute(Sender: TObject);
var i: Integer;
begin
  i:=LBDev.ItemIndex;
  if (i>=0) and (i<ECScheme.Devices.Count) then
    ECScheme.Devices.DeleteDevice(i);
end;

procedure TSchemeDsgn.AcSaveToXMLExecute(Sender: TObject);
begin
  if DlgSave.Execute then
    try
      ECScheme.SaveSchemeToXML(DlgSave.FileName, 'Scheme');
      SchemeChanged:=False;
    except
      MessageDlg('Cannot save scheme to file '+DlgSave.FileName, mtError, [mbOk], 0);
    end;
end;

procedure TSchemeDsgn.BBDelOutClick(Sender: TObject);
begin
  Device.DeleteConnIndex(LBConn.ItemIndex);
  LBDevSelectionChange(nil, False);
end;

procedure TSchemeDsgn.BBLoadClick(Sender: TObject);
begin
  while SchemeChanged do
    case MessageDlg('Scheme changed. Save?', mtConfirmation, mbYesNoCancel, 0) of
      mrCancel: exit;  { Exit }
      mrYes: AcSaveToXML.Execute;
      mrNo: break;
    end;
  if DlgOpen.Execute then ECScheme.LoadSchemeFromXML(DlgOpen.FileName, 'Scheme', GetXMLFlags);
  SetSchemeOptions;
  DoSchemeChanged;
  SchemeChanged:=False;
  writeln('LOAD END');
end;

procedure TSchemeDsgn.BBLoadDemoClick(Sender: TObject);
begin
  while SchemeChanged do
    case MessageDlg('Scheme changed. Save?', mtConfirmation, mbYesNoCancel, 0) of
      mrCancel: exit;  { Exit }
      mrYes: AcSaveToXML.Execute;
      mrNo: break;
    end;
  ECScheme.LoadSchemeFromXML(GetCurrentDirUTF8+DirectorySeparator+'demo.xml', 'Scheme');
  SetSchemeOptions;
  DoSchemeChanged;
  SchemeChanged:=False;
end;

procedure TSchemeDsgn.BBReverseConClick(Sender: TObject);
var aOutput, aInput: Integer;

  procedure ShowMessageDialog;
  begin
    MessageDlg('Cannot reverse connection '+inttostr(aOutput)+' to '+inttostr(aInput)+'.',
      mtInformation , [mbOk], 0);
  end;

begin
  aOutput:=LBDev.ItemIndex;
  aInput:=LBConn.ItemIndex;
  if (aOutput>=0) and (aInput>=0) then
    begin
      aInput:=ECScheme.Devices[aOutput].Outputs[aInput].Input;
      if not ECScheme.Devices.ReverseConnection(aOutput, aInput)
        then ShowMessageDialog
        else LBDevSelectionChange(nil, False);
    end else
    ShowMessageDialog;
end;

procedure TSchemeDsgn.BBSaveClick(Sender: TObject);
begin
  if DlgSave.Execute then
    try
      ECScheme.SaveSchemeToXML(DlgSave.FileName, 'Scheme', GetXMLFlags);
      SchemeChanged:=False;
    except
      MessageDlg('Cannot save scheme to '+DlgSave.FileName+'.', mtError, [mbOk], 0);
    end;
end;

procedure TSchemeDsgn.CBBoldChange(Sender: TObject);
var aOpts: TConnectionOptions;
begin
  aOpts:=PConnection^.Options;
  if (Sender as TCheckBox).Checked
    then include(aOpts, ecoBold)
    else exclude(aOpts, ecoBold);
  PConnection^.Options:=aOpts;
  ECScheme.InvalidateNonUpdated;
end;

procedure TSchemeDsgn.CBArrowChange(Sender: TObject);
var aOpts: TConnectionOptions;
begin
  aOpts:=PConnection^.Options;
  if (Sender as TCheckBox).Checked
    then include(aOpts, ecoArrow)
    else exclude(aOpts, ecoArrow);
  PConnection^.Options:=aOpts;
  ECScheme.InvalidateNonUpdated;
end;

procedure TSchemeDsgn.CBAutosizedChange(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked
    then Device.Options:=Device.Options+[edoAutosized]
    else Device.Options:=Device.Options-[edoAutosized];
end;

procedure TSchemeDsgn.ClrBtnBlkClrColorChanged(Sender: TObject);
begin
  ECScheme.BlockColor:=(Sender as TColorButton).ButtonColor;
end;

procedure TSchemeDsgn.ClrBtnBlkFntClrColorChanged(Sender: TObject);
begin
  ECScheme.Font.Color:=(Sender as TColorButton).ButtonColor;
end;

procedure TSchemeDsgn.CmbBlkStyleChange(Sender: TObject);
begin
  ECScheme.BlockStyle:=TBlockStyle((Sender as TComboBox).ItemIndex);
end;

procedure TSchemeDsgn.CmbLayoutChange(Sender: TObject);
begin
  ECScheme.Layout:=TObjectPos((Sender as TComboBox).ItemIndex);
end;

procedure TSchemeDsgn.DoSchemeChanged;
var aDevice: TECDevice;
begin
  LBDev.Clear;
  for aDevice in ECScheme.Devices do
    LBDev.Items.Add(aDevice.Caption);
end;

procedure TSchemeDsgn.ECSchemeContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var b: Boolean;
    i: Integer;
    aMI: TMenuItem;
begin
  b:= (ECScheme.Hovering>=0) and (length(ECScheme.Devices[ECScheme.Hovering].Outputs)>0);
  MIClearOut.Enabled:=b;
  if b then
    begin
      MIClearOut.Clear;
      for i:=0 to length(ECScheme.Devices[ECScheme.Hovering].Outputs)-1 do
        begin
          aMI:=TMenuItem.Create(self);
          with aMI do
            begin
              Caption:='to '+ECScheme.Devices[ECScheme.Devices[ECScheme.Hovering].Outputs[i].Input].Caption;
              Tag:=i;
              OnClick:=@MIConnectionClick;
            end;
          MIClearOut.Add(aMI);
        end;
    end;
end;

procedure TSchemeDsgn.ClrBtnConClrColorChanged(Sender: TObject);
begin
  PConnection^.Color:=(Sender as TColorButton).ButtonColor;
end;

procedure TSchemeDsgn.CBDashChange(Sender: TObject);
var aOpts: TConnectionOptions;
begin
  aOpts:=PConnection^.Options;
  if (Sender as TCheckBox).Checked
    then include(aOpts, ecoDashed)
    else exclude(aOpts, ecoDashed);
  PConnection^.Options:=aOpts;
  ECScheme.InvalidateNonUpdated;
end;

procedure TSchemeDsgn.CBDotChange(Sender: TObject);
var aOpts: TConnectionOptions;
begin
  aOpts:=PConnection^.Options;
  if (Sender as TCheckBox).Checked
    then include(aOpts, ecoDotted)
    else exclude(aOpts, ecoDotted);
  PConnection^.Options:=aOpts;
  ECScheme.InvalidateNonUpdated;
end;

procedure TSchemeDsgn.CBFixedChange(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked
    then Device.Options:=Device.Options+[edoFixed]
    else Device.Options:=Device.Options-[edoFixed];
end;

procedure TSchemeDsgn.CBImagesChange(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked
    then ECScheme.Images:=IL1
    else ECScheme.Images:=nil;
end;

procedure TSchemeDsgn.CBLConnectionChange(Sender: TObject);
var aOpts: TConnectionOptions;
begin
  aOpts:=PConnection^.Options;
  if (Sender as TCheckBox).Checked
    then include(aOpts, ecoL_Connection)
    else exclude(aOpts, ecoL_Connection);
  PConnection^.Options:=aOpts;
  ECScheme.InvalidateNonUpdated;
end;

procedure TSchemeDsgn.CBLConnVertThenHorChange(Sender: TObject);
var aOpts: TConnectionOptions;
begin
  aOpts:=PConnection^.Options;
  if (Sender as TCheckBox).Checked
    then include(aOpts, ecoL_VertThenHor)
    else exclude(aOpts, ecoL_VertThenHor);
  PConnection^.Options:=aOpts;
  ECScheme.InvalidateNonUpdated;
end;

procedure TSchemeDsgn.CBNoIconChange(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked
    then Device.Options:=Device.Options+[edoNoIcon]
    else Device.Options:=Device.Options-[edoNoIcon];
end;

procedure TSchemeDsgn.CBNoTextChange(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked
    then Device.Options:=Device.Options+[edoNoText]
    else Device.Options:=Device.Options-[edoNoText];
end;

procedure TSchemeDsgn.CBShowGridChange(Sender: TObject);
var aOpts: TSchemeOptions;
begin
  aOpts:=ECScheme.Options;
  if (Sender as TCheckBox).Checked
    then include(aOpts, esoShowGrid)
    else exclude(aOpts, esoShowGrid);
  ECScheme.Options:=aOpts;
end;

procedure TSchemeDsgn.CBSnapToGridChange(Sender: TObject);
var aOpts: TSchemeOptions;
begin
  aOpts:=ECScheme.Options;
  if (Sender as TCheckBox).Checked
    then include(aOpts, esoSnapToGrid)
    else exclude(aOpts, esoSnapToGrid);
  ECScheme.Options:=aOpts;
end;

procedure TSchemeDsgn.CmbDevStyleChange(Sender: TObject);
begin
  Device.Style:=TBlockStyle((Sender as TComboBox).ItemIndex);
end;

procedure TSchemeDsgn.CGSchemeOptsItemClick(Sender: TObject; Index: integer);
begin
  CGToSchemeOpts;
  GBDevSpec.Enabled:= not (Sender as TCheckGroup).Checked[0];
  GBBlockSpec.Enabled:= (Sender as TCheckGroup).Checked[0];
end;

procedure TSchemeDsgn.CGToSchemeOpts;
var aOpts: TSchemeOptions;
begin
  aOpts:=[];
  if CGSchemeOpts.Checked[0] then include(aOpts, esoIdenticalBlocks);
  if CGSchemeOpts.Checked[1] then include(aOpts, esoDescriptionOnBlock);
  if CGSchemeOpts.Checked[2] then include(aOpts, esoDescriptionToHint);
  if CGSchemeOpts.Checked[3] then include(aOpts, esoFullDragRepaint);
  if CGSchemeOpts.Checked[4] then include(aOpts, esoRectangularConnect);
  if CGSchemeOpts.Checked[5] then include(aOpts, esoReadOnly);
  if CBSnapToGrid.Checked then include(aOpts, esoSnapToGrid);
  if CBShowGrid.Checked then include(aOpts, esoShowGrid);
  ECScheme.Options:=aOpts;
end;

procedure TSchemeDsgn.ClrBtnDevClrColorChanged(Sender: TObject);
begin
  Device.Color:=(Sender as TColorButton).ButtonColor;
end;

procedure TSchemeDsgn.ClrBtnDevFntClrColorChanged(Sender: TObject);
begin
  Device.FontColor:=(Sender as TColorButton).ButtonColor;
end;

procedure TSchemeDsgn.ECSchemeSchemeChange(Sender: TObject);
begin
  SchemeChanged:=True;
  DoSchemeChanged;
end;

procedure TSchemeDsgn.ECSchemeSelectionChange(Sender: TObject);
begin
  LBDev.ItemIndex:=(Sender as TECScheme).GetFirstSelected;
end;

procedure TSchemeDsgn.MemCapEditingDone(Sender: TObject);
var aIndex: Integer;
begin
  Device.Caption:=(Sender as TMemo).Text;
  aIndex:=LBDev.ItemIndex;
  DoSchemeChanged;
  LBDev.ItemIndex:=aIndex;
end;

procedure TSchemeDsgn.MemDescEditingDone(Sender: TObject);
begin
  Device.Description:=(Sender as TMemo).Text;
end;

procedure TSchemeDsgn.MIConnectionClick(Sender: TObject);
begin
  ECScheme.Devices[ECScheme.Hovering].DeleteConnIndex((Sender as TMenuItem).Tag);
end;

procedure TSchemeDsgn.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose:=False;
  while SchemeChanged do
    case MessageDlg('Scheme changed. Save?', mtConfirmation, mbYesNoCancel, 0) of
      mrCancel: exit;  { Exit! }
      mrYes: AcSaveToXML.Execute;
      mrNo: break;
    end;
  CanClose:=True;
end;

procedure TSchemeDsgn.FormCreate(Sender: TObject);
var i: Integer;
begin
  SetSchemeOptions;
  DlgOpen.FileName:=GetCurrentDir;
  for i:=0 to CGXMLFlags.Items.Count-1 do
    CGXMLFlags.Checked[i]:=True;
end;

function TSchemeDsgn.GetXMLFlags: TXMLFlags;
begin
  Result:=[];
  if CGXMLFlags.Checked[0] then include(Result, exfCaption);
  if CGXMLFlags.Checked[1] then include(Result, exfConfig);
  if CGXMLFlags.Checked[2] then include(Result, exfDescript);
  if CGXMLFlags.Checked[3] then include(Result, exfGeometry);
  if CGXMLFlags.Checked[4] then include(Result, exfScheme);
  if CGXMLFlags.Checked[5] then include(Result, exfVisuals);
end;

procedure TSchemeDsgn.LBConnSelectionChange(Sender: TObject; User: boolean);
var aIndex: Integer;
    aOpts: TConnectionOptions;
begin
  aIndex:=LBConn.ItemIndex;
  if aIndex>=0 then
    begin
      PConnection:=@Device.Outputs[aIndex];
      GBConn.Enabled:=True;
      aOpts:=Device.Outputs[aIndex].Options;
      CBArrow.Checked:= (ecoArrow in aOpts);
      CBDash.Checked:= (ecoDashed in aOpts);
      CBDot.Checked:= (ecoDotted in aOpts);
      CBBold.Checked:= (ecoBold in aOpts);
      CBLConnection.Checked:= (ecoL_Connection in aOpts);
      CBLConnVertThenHor.Checked:= (ecoL_VertThenHor in aOpts);
      ClrBtnConClr.ButtonColor:=Device.Outputs[aIndex].Color;
      BBReverseCon.Enabled:=True;
      BBDelOut.Enabled:=True;
    end else
    begin
      PConnection:=nil;
      GBConn.Enabled:=False;
      BBReverseCon.Enabled:=False;
      BBDelOut.Enabled:=False;
    end;
end;

procedure TSchemeDsgn.LBDevSelectionChange(Sender: TObject; User: boolean);
var i, aIndex: Integer;
begin
  LBConn.Clear;
  LBConnSelectionChange(nil, False);
  aIndex:=LBDev.ItemIndex;
  if aIndex>=0 then
    begin
      Device:=ECScheme.Devices[aIndex];
      GBDev.Enabled:=True;
      GBDevOpts.Enabled:=True;
      GBDevSpec.Enabled:=True;
      PanConn.Enabled:=True;
      MemCap.Text:=Device.Caption;
      MemDesc.Text:=Device.Description;
      CBAutosized.Checked:= (edoAutosized in Device.Options);
      CBFixed.Checked:= (edoFixed in Device.Options);
      CBNoIcon.Checked:= (edoNoIcon in Device.Options);
      CBNoText.Checked:= (edoNoText in Device.Options);
      CmbDevStyle.ItemIndex:=Integer(Device.Style);
      SEImageIdx.Value:=Device.ImageIndex;
      SEMaxIn.Value:=Device.MaxInputs;
      SEMaxOut.Value:=Device.MaxOutputs;
      SETag.Value:=Device.Tag;
      SEDevBW.Value:=Device.Width;
      SEDevBH.Value:=Device.Height;
      ClrBtnDevClr.ButtonColor:=Device.Color;
      ClrBtnDevFntClr.ButtonColor:=Device.FontColor;
      for i:=0 to length(Device.Outputs)-1 do
        LBConn.Items.Add('to '+ECScheme.Devices[Device.Outputs[i].Input].Caption);
    end else
    begin
      Device:=nil;
      GBDev.Enabled:=False;
      GBDevOpts.Enabled:=False;
      GBDevSpec.Enabled:=True;
      PanConn.Enabled:=False;
    end;
end;

procedure TSchemeDsgn.SBtnDefBlkClrClick(Sender: TObject);
begin
  ClrBtnBlkClr.ButtonColor:=clDefault;
  ECScheme.BlockColor:=clDefault;
end;

procedure TSchemeDsgn.SBtnDefBlkFntClrClick(Sender: TObject);
begin
  ClrBtnBlkFntClr.ButtonColor:=clDefault;
  ECScheme.Font.Color:=clDefault;
end;

procedure TSchemeDsgn.SBtnDefConClrClick(Sender: TObject);
begin
  ClrBtnConClr.ButtonColor:=clDefault;
  PConnection^.Color:=clDefault;
end;

procedure TSchemeDsgn.SBtnDefDevClrClick(Sender: TObject);
begin
  ClrBtnDevClr.ButtonColor:=clDefault;
  Device.Color:=clDefault;
end;

procedure TSchemeDsgn.SBtnDefDevFontClrClick(Sender: TObject);
begin
  ClrBtnDevFntClr.ButtonColor:=clDefault;
  Device.FontColor:=clDefault;
end;

procedure TSchemeDsgn.SchemeOptsToCG;
var aOpts: TSchemeOptions;
begin
  aOpts:=ECScheme.Options;
  CGSchemeOpts.Checked[0]:= (esoIdenticalBlocks in aOpts);
  CGSchemeOpts.Checked[1]:= (esoDescriptionOnBlock in aOpts);
  CGSchemeOpts.Checked[2]:= (esoDescriptionToHint in aOpts);
  CGSchemeOpts.Checked[3]:= (esoFullDragRepaint in aOpts);
  CGSchemeOpts.Checked[4]:= (esoRectangularConnect in aOpts);
  CGSchemeOpts.Checked[5]:= (esoReadOnly in aOpts);
end;

procedure TSchemeDsgn.SEBHChange(Sender: TObject);
begin
  ECScheme.BlockHeight:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SEBWChange(Sender: TObject);
begin
  ECScheme.BlockWidth:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SECPWChange(Sender: TObject);
begin
  ECScheme.ConnectorWidth:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SEDevBHChange(Sender: TObject);
begin
  Device.Height:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SEDevBWChange(Sender: TObject);
begin
  Device.Width:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SEFSChange(Sender: TObject);
begin
  ECScheme.BlockFontSize:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SEGridChange(Sender: TObject);
begin
  ECScheme.Grid:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SEImageIdxChange(Sender: TObject);
begin
  Device.ImageIndex:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SEMaxInChange(Sender: TObject);
begin
  Device.MaxInputs:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SEMaxOutChange(Sender: TObject);
begin
  Device.MaxOutputs:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SETagChange(Sender: TObject);
begin
  Device.Tag:=(Sender as TSpinEdit).Value;
end;

procedure TSchemeDsgn.SetSchemeOptions;
begin
  SchemeOptsToCG;
  SEGrid.Value:=ECScheme.Grid;
  SEBW.Value:=ECScheme.BlockWidth;
  SEBH.Value:=ECScheme.BlockHeight;
  CmbBlkStyle.ItemIndex:=Integer(ECScheme.BlockStyle);
  SEFS.Value:=ECScheme.BlockFontSize;
  SECPW.Value:=ECScheme.ConnectorWidth;
  CBShowGrid.Checked:= (esoShowGrid in ECScheme.Options);
  CBSnapToGrid.Checked:= (esoSnapToGrid in ECScheme.Options);
  GBDevSpec.Enabled:= not CGSchemeOpts.Checked[0] and assigned(Device);
  GBBlockSpec.Enabled:= CGSchemeOpts.Checked[0];
end;

end.

