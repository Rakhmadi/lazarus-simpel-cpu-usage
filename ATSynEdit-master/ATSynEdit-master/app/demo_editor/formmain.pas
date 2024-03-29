unit formmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Spin, ComCtrls, Menus, LclIntf,
  ATStrings,
  ATStringProc,
  ATSynEdit,
  ATSynEdit_CanvasProc,
  ATSynEdit_Carets,
  ATSynEdit_Gaps,
  ATSynEdit_Finder,
  ATSynEdit_Export_HTML,
  ATSynEdit_Hotspots,
  ATSynEdit_DimRanges,
  formkey,
  formopt,
  formfind;

type
  { TfmMain }
  TfmMain = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    bFont: TButton;
    bOpt: TButton;
    btnStop: TButton;
    bClearLog: TButton;
    chkMinimapTooltip: TCheckBox;
    chkMouseEn: TCheckBox;
    chkTabSpaces: TCheckBox;
    chkNewScroll: TCheckBox;
    chkMinimapLeft: TCheckBox;
    chkGutter: TCheckBox;
    chkMicromap: TCheckBox;
    chkMinimap: TCheckBox;
    chkRuler: TCheckBox;
    chkUnprintEnd: TCheckBox;
    chkUnprintEndDet: TCheckBox;
    chkUnprintSp: TCheckBox;
    chkUnprintVis: TCheckBox;
    chkWrapIndent: TCheckBox;
    chkWrapMargin: TRadioButton;
    chkWrapOff: TRadioButton;
    chkWrapOn: TRadioButton;
    edFontsize: TSpinEdit;
    edMarginFixed: TSpinEdit;
    edSpaceX: TSpinEdit;
    edSpaceY: TSpinEdit;
    edTabsize: TSpinEdit;
    FontDialog1: TFontDialog;
    gUnpri: TGroupBox;
    gWrap: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    ListboxLog: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    mnuTestGapPanels: TMenuItem;
    mnuShowPane: TMenuItem;
    mnuTestGapAdd: TMenuItem;
    mnuTestGapClear: TMenuItem;
    mnuTestMarker: TMenuItem;
    MenuItem5: TMenuItem;
    mnuFileExit: TMenuItem;
    MenuItem12: TMenuItem;
    mnuFileSave: TMenuItem;
    mnuFileHtml: TMenuItem;
    mnuFindNext: TMenuItem;
    mnuFind: TMenuItem;
    MenuItem9: TMenuItem;
    mnuTestSyntax: TMenuItem;
    mnuEnc: TMenuItem;
    MenuItem2: TMenuItem;
    mnuHelpMous: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    mnuOpts: TMenuItem;
    mnuBms: TMenuItem;
    mnuTestHiliteWww: TMenuItem;
    mnuTestCaret1: TMenuItem;
    mnuOptDlg: TMenuItem;
    mnuTestBookmk: TMenuItem;
    mnuTestMargins: TMenuItem;
    mnuFile: TMenuItem;
    mnuHlp: TMenuItem;
    mnuFileEnd: TMenuItem;
    mnuTst: TMenuItem;
    mnuTestCaret2: TMenuItem;
    mnuEndWin: TMenuItem;
    mnuEndUnix: TMenuItem;
    mnuEndMac: TMenuItem;
    mnuHelpKey: TMenuItem;
    mnuFileOpen: TMenuItem;
    mnuFileSaveAs: TMenuItem;
    mnuGoto: TMenuItem;
    OpenDialog1: TOpenDialog;
    PanelMain: TPanel;
    PanelRt: TPanel;
    PopupBookmk: TPopupMenu;
    PopupFold: TPopupMenu;
    PopupMinimap: TPopupMenu;
    PopupMicromap: TPopupMenu;
    PopupRuler: TPopupMenu;
    PopupNums: TPopupMenu;
    progress: TProgressBar;
    SaveDialog1: TSaveDialog;
    Status: TStatusBar;
    StatusMsg: TStatusBar;
    TimerHint: TTimer;
    procedure bClearLogClick(Sender: TObject);
    procedure bGotoClick(Sender: TObject);
    procedure btnMarkerClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure chkMinimapLeftChange(Sender: TObject);
    procedure chkMinimapTooltipChange(Sender: TObject);
    procedure chkMouseEnChange(Sender: TObject);
    procedure chkNewScrollChange(Sender: TObject);
    procedure chkTabSpacesChange(Sender: TObject);
    procedure FinderProgress(Sender: TObject; const ACurPos, AMaxPos: Int64; var AContinue: boolean);
    procedure MenuItem14Click(Sender: TObject);
    procedure mnuFileExitClick(Sender: TObject);
    procedure mnuFileHtmlClick(Sender: TObject);
    procedure mnuFileOpenClick(Sender: TObject);
    procedure bFontClick(Sender: TObject);
    procedure bAddCrtClick(Sender: TObject);
    procedure mnuFileSaveAsClick(Sender: TObject);
    procedure bKeymapClick(Sender: TObject);
    procedure bOptClick(Sender: TObject);
    procedure mnuFileSaveClick(Sender: TObject);
    procedure mnuFindClick(Sender: TObject);
    procedure mnuFindNextClick(Sender: TObject);
    procedure mnuTestGapAddClick(Sender: TObject);
    procedure mnuTestGapClearClick(Sender: TObject);
    procedure mnuTestGapPanelsClick(Sender: TObject);
    procedure mnuTestSyntaxClick(Sender: TObject);
    procedure TimerHintTimer(Sender: TObject);
    procedure UpdateEnc;
    procedure mnuHelpMousClick(Sender: TObject);
    procedure chkGutterChange(Sender: TObject);
    procedure chkMicromapChange(Sender: TObject);
    procedure chkMinimapChange(Sender: TObject);
    procedure mnuBmsClick(Sender: TObject);
    procedure mnuShowPaneClick(Sender: TObject);
    procedure chkRulerChange(Sender: TObject);
    procedure chkUnprintVisChange(Sender: TObject);
    procedure chkUnprintEndChange(Sender: TObject);
    procedure chkUnprintEndDetChange(Sender: TObject);
    procedure chkUnprintSpChange(Sender: TObject);
    procedure chkWrapMarginChange(Sender: TObject);
    procedure chkWrapOffChange(Sender: TObject);
    procedure chkWrapOnChange(Sender: TObject);
    procedure chkWrapIndentChange(Sender: TObject);
    procedure edFontsizeChange(Sender: TObject);
    procedure edMarginFixedChange(Sender: TObject);
    procedure edSpaceXChange(Sender: TObject);
    procedure edSpaceYChange(Sender: TObject);
    procedure edTabsizeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuEndMacClick(Sender: TObject);
    procedure mnuEndUnixClick(Sender: TObject);
    procedure mnuEndWinClick(Sender: TObject);
    procedure mnuTestHiliteWwwClick(Sender: TObject);
    procedure mnuLockClick(Sender: TObject);
    procedure mnuTestBookmkClick(Sender: TObject);
    procedure mnuTestCaret1Click(Sender: TObject);
    procedure mnuTestMarginsClick(Sender: TObject);
    procedure mnuUnlockClick(Sender: TObject);
  private
    { private declarations }
    ed: TATSynEdit;
    wait: boolean;
    FFilesDir: string;
    FFileName: string;
    FFinder: TATEditorFinder;
    FFindStopped: boolean;
    FFindConfirmAll: TModalResult;
    FFindMarkAll: boolean;
    ed_gap: TATSynEdit;
    FGapInitSize: integer;
    procedure DoAddEnc(Sub, SName: string);
    procedure DoLog(const S: string);
    procedure EditHotspotEnter(Sender: TObject; AHotspotIndex: integer);
    procedure EditHotspotExit(Sender: TObject; AHotspotIndex: integer);
    procedure EditorGapChange(Sender: TObject);
    procedure EditorGapDelete(Sender: TObject; ALineIndex: integer);
    procedure EditStringsChangeBlock(Sender: TObject; const AStartPos,
      AEndPos: TPoint; AChange: TATBlockChangeKind; ABlock: TStringList);
    procedure EditClickGap(Sender: TObject; AGapItem: TATSynGapItem; APos: TPoint);
    procedure EditStringsChange(Sender: TObject; ALine: integer;
      AChange: TATLineChangeKind);
    procedure FinderBadRegex(Sender: TObject);
    procedure FinderConfirmReplace(Sender: TObject; APos1, APos2: TPoint;
      AForMany: boolean; var AConfirm, AContinue: boolean);
    procedure DoFindError;
    procedure DoOpen(const fn: string; ADetectEnc: boolean);
    procedure DoSetEnc(const Str: string);
    procedure EditChanged(Sender: TObject);
    procedure EditCaretMoved(Sender: TObject);
    procedure EditDrawLine(Sender: TObject; C: TCanvas; AX, AY: integer;
      const AStr: atString; ACharSize: TPoint; const AExtent: TATIntArray);
    procedure EditCalcLine(Sender: TObject; var AParts: TATLineParts;
      ALineIndex, ACharIndex, ALineLen: integer; var AColorAfterEol: TColor);
    procedure EditScroll(Sender: TObject);
    procedure EditCommand(Sender: TObject; ACmd{%H-}: integer; const AText: string; var AHandled: boolean);
    procedure EditClickGutter(Sender: TObject; ABand, ALine: integer);
    procedure EditClickMicromap(Sender: TObject; AX, AY: integer);
    procedure EditDrawBm(Sender: TObject; C: TCanvas; ALineNum{%H-}: integer; const ARect: TRect);
    procedure EditDrawMicromap(Sender: TObject; C: TCanvas; const ARect: TRect);
    procedure EditDrawTest(Sender: TObject; C: TCanvas; const ARect: TRect);
    procedure EditDrawGap(Sender: TObject; C: TCanvas; const ARect: TRect; AGap: TATSynGapItem);
    procedure FinderFound(Sender: TObject; APos1, APos2: TPoint);
    procedure FinderUpdateEditor(AUpdateText: boolean);
    procedure MenuEncClick(Sender: TObject);
    procedure MsgStatus(const S: string);
    procedure UpdateGapPanel;
    procedure UpdateStatus;
    procedure UpdateChecks;
  public
    { public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses
  Types, Math,
  LCLType, LCLProc,
  atsynedit_commands;

{$R *.lfm}

const
  sEncAnsi = 'ANSI';
  sEncUtf8 = 'UTF-8';
  sEncUtf8NoBom = 'UTF-8 no bom';
  sEncUtf16LE = 'UTF-16 LE';
  sEncUtf16BE = 'UTF-16 BE';

const
  cColorBmIco = clMedGray;

procedure DoPaintGap(C: TCanvas; R: TRect; ALine: integer);
begin
  C.Brush.Color:= clMoneyGreen;
  C.Pen.Color:= C.Brush.Color;
  C.FillRect(R);
  C.Font.Size:= 9;
  C.Font.Color:= clGray;
  C.TextOut(R.Left+20, R.Top+1, 'gap for line '+IntToStr(ALine));
end;


{ TfmMain }

procedure TfmMain.FormCreate(Sender: TObject);
begin
  UpdateEnc;

  FFilesDir:= ExtractFilePath(ExtractFileDir(ExtractFileDir(Application.ExeName)))+'test_files';
  wait:= true;

  ed:= TATSynEdit.Create(Self);
  ed.Parent:= PanelMain;
  ed.Align:= alClient;
  {$ifdef windows}
  ed.Font.Name:= 'Consolas';
  {$else}
  ed.Font.Name:= 'Courier New';
  {$endif}

  ed.PopupGutterBm:= PopupBookmk;
  ed.PopupGutterNum:= PopupNums;
  ed.PopupGutterFold:= PopupFold;
  ed.PopupMinimap:= PopupMinimap;
  ed.PopupMicromap:= PopupMicromap;
  ed.PopupRuler:= PopupRuler;

  ed.OnChange:= @EditChanged;
  ed.Strings.OnChange:=@EditStringsChange;
  ed.Strings.OnChangeBlock:=@EditStringsChangeBlock;
  ed.OnChangeCaretPos:= @EditCaretMoved;
  ed.OnChangeState:= @EditCaretMoved;
  ed.OnScroll:=@EditScroll;
  ed.OnCommand:= @EditCommand;
  ed.OnClickGutter:= @EditClickGutter;
  ed.OnClickMicromap:= @EditClickMicromap;
  ed.OnClickGap:= @EditClickGap;
  ed.OnDrawBookmarkIcon:= @EditDrawBm;
  ed.OnDrawLine:= @EditDrawLine;
  ed.OnDrawMicromap:= @EditDrawMicromap;
  ed.OnDrawGap:= @EditDrawGap;
  ed.OnHotspotEnter:= @EditHotspotEnter;
  ed.OnHotspotExit:= @EditHotspotExit;

  ed.SetFocus;

  FFinder:= TATEditorFinder.Create;
  FFinder.Editor:= ed;
  FFinder.OptRegex:= true;
  FFinder.OnConfirmReplace:= @FinderConfirmReplace;
  FFinder.OnProgress:= @FinderProgress;
  FFinder.OnBadRegex:= @FinderBadRegex;
  FFinder.OnFound:= @FinderFound;

  ed_gap:= TATSynEdit.Create(Self);
  ed_gap.Text:= '(inline editor)';
  ed_gap.Colors.TextBG:= $80f0f0;
  ed_gap.OptRulerVisible:= false;
  ed_gap.OptUnprintedVisible:= false;
  ed_gap.OptMarginRight:= 2000;
  ed_gap.OptScrollbarsNew:= ed.OptScrollbarsNew;
  ed_gap.OptGutterVisible:= false;
  //ed_gap.Gutter[ed_gap.GutterBandBm].Visible:= false;
  //ed_gap.Gutter[ed_gap.GutterBandFold].Visible:= false;
  //ed_gap.Gutter[ed_gap.GutterBandState].Visible:= false;
  ed_gap.Parent:= ed;
  ed_gap.OnChange:= @EditorGapChange;
  ed.Gaps.OnDelete:=@EditorGapDelete;
  ed_gap.Hide;
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  fn: string;
begin
  if wait then UpdateChecks;
  wait:= false;
  ActiveControl:= ed;

  fn:= FFilesDir+'/fn.txt';
  if FileExists(fn) then
    DoOpen(fn, true);
end;

procedure TfmMain.mnuEndMacClick(Sender: TObject);
begin
  ed.Strings.Endings:= cEndMac;
  ed.Update;
  UpdateStatus;
end;

procedure TfmMain.mnuEndUnixClick(Sender: TObject);
begin
  ed.Strings.Endings:= cEndUnix;
  ed.Update;
  UpdateStatus;
end;

procedure TfmMain.mnuEndWinClick(Sender: TObject);
begin
  ed.Strings.Endings:= cEndWin;
  ed.Update;
  UpdateStatus;
end;

procedure TfmMain.mnuTestHiliteWwwClick(Sender: TObject);
begin
  with mnuTestHiliteWww do Checked:= not Checked;
  ed.Update;
end;

procedure TfmMain.mnuLockClick(Sender: TObject);
begin
  ed.BeginUpdate;
end;

procedure TfmMain.mnuTestBookmkClick(Sender: TObject);
var
  NIndex, i: integer;
begin
  for i:= 0 to ed.Strings.Count-1 do
  begin
    NIndex:= ed.Strings.Bookmarks.Find(i);
    if NIndex>=0 then
      ed.Strings.Bookmarks.Delete(NIndex)
    else
      ed.Strings.Bookmarks.Add(i, 1, '');
  end;
  ed.Update;
end;

procedure TfmMain.mnuTestCaret1Click(Sender: TObject);
var
  i: integer;
begin
  for i:= 1 to 100 do
    ed.Carets.Add(0, i);
  ed.Carets.Sort;
  ed.Update;
  UpdateStatus;
end;

procedure TfmMain.mnuTestMarginsClick(Sender: TObject);
var
  S: string;
begin
  S:= ed.OptMarginString;
  if InputQuery('Margins', 'space separated ints', S) then
  begin
    ed.OptMarginString:= S;
    ed.Update;
  end;
end;

procedure TfmMain.mnuUnlockClick(Sender: TObject);
begin
  ed.EndUpdate;
end;

procedure TfmMain.EditCaretMoved(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TfmMain.UpdateStatus;
const
  cEnd: array[TATLineEnds] of string = ('?', 'Win', 'Unix', 'Mac');
  cOvr: array[boolean] of string = ('-', 'Ovr');
  cRo: array[boolean] of string = ('-', 'RO');
  cMod: array[boolean] of string = ('-', 'Mod');
  cSel: array[boolean] of string = ('-', 'Column');
var
  sPos, sCount: string;
  i: integer;
begin
  sPos:= '';
  for i:= 0 to Min(4, ed.Carets.Count-1) do
    with ed.Carets[i] do
      sPos:= sPos+Format(' %d:%d', [PosY+1, PosX+1]);

  sCount:= '';
  if ed.LastCommandChangedLines>0 then
    sCount:= Format('%d lines chg', [ed.LastCommandChangedLines]);

  Status.SimpleText:= Format('Line:Col%s | Carets: %d | Top: %d | %s | %s %s %s %s | Undo: %d, Redo: %d | %s', [
    sPos,
    ed.Carets.Count,
    ed.LineTop+1,
    cEnd[ed.Strings.Endings],
    cOvr[ed.ModeOverwrite],
    cRo[ed.ModeReadOnly],
    cSel[not ed.IsSelRectEmpty],
    cMod[ed.Modified],
    ed.UndoCount,
    ed.RedoCount,
    sCount
    ]);
end;

procedure TfmMain.UpdateChecks;
begin
  chkGutter.Checked:= ed.OptGutterVisible;
  chkRuler.Checked:= ed.OptRulerVisible;
  chkMinimap.Checked:= ed.OptMinimapVisible;
  chkMinimapLeft.Checked:= ed.OptMinimapAtLeft;
  chkMicromap.Checked:= ed.OptMicromapVisible;
  chkTabSpaces.Checked:= ed.OptTabSpaces;
  chkNewScroll.Checked:= ed.OptScrollbarsNew;
  edFontsize.Value:= ed.Font.Size;
  edTabsize.Value:= ed.OptTabSize;
  edSpaceX.Value:= ed.OptCharSpacingX;
  edSpaceY.Value:= ed.OptCharSpacingY;
  edMarginFixed.Value:= ed.OptMarginRight;
  case ed.OptWrapMode of
    cWrapOff: chkWrapOff.Checked:= true;
    cWrapOn: chkWrapOn.Checked:= true;
    cWrapAtMargin: chkWrapMargin.Checked:= true;
  end;
  chkWrapIndent.Checked:= ed.OptWrapIndented;
  chkUnprintVis.Checked:= ed.OptUnprintedVisible;
  chkUnprintSp.Checked:= ed.OptUnprintedSpaces;
  chkUnprintEnd.Checked:= ed.OptUnprintedEnds;
  chkUnprintEndDet.Checked:= ed.OptUnprintedEndsDetails;
end;

procedure TfmMain.EditScroll(Sender: TObject);
begin
  EditCaretMoved(Sender);
  UpdateGapPanel;
end;

procedure TfmMain.EditCommand(Sender: TObject; ACmd: integer;
  const AText: string; var AHandled: boolean);
begin
  AHandled:= false;
  {
  if ACmd=cCommand_KeyTab then
  begin
    AHandled:= true;
    Beep;
  end;
  }
end;

procedure TfmMain.EditClickGutter(Sender: TObject; ABand, ALine: integer);
var
  NIndex: integer;
begin
  if ABand=ed.GutterBandBm then
  begin
    NIndex:= ed.Strings.Bookmarks.Find(ALine);
    if NIndex>=0 then
      ed.Strings.Bookmarks.Delete(NIndex)
    else
      ed.Strings.Bookmarks.Add(ALine, 1, Format('Bookmark for line %d', [ALine+1]));
    ed.Update;
  end;
end;

procedure TfmMain.EditClickMicromap(Sender: TObject; AX, AY: integer);
begin
  Showmessage(Format('Micromap click: %d:%d', [AX, AY]));
end;

procedure TfmMain.EditDrawBm(Sender: TObject; C: TCanvas; ALineNum: integer;
  const ARect: TRect);
var
  r: trect;
  dx: integer;
begin
  r:= arect;
  if IsRectEmpty(r) then exit;
  c.brush.color:= cColorBmIco;
  c.pen.color:= cColorBmIco;
  inc(r.top, 1);
  inc(r.left, 4);
  dx:= (r.bottom-r.top) div 2-1;
  c.Polygon([Point(r.left, r.top), Point(r.left+dx, r.top+dx), Point(r.left, r.top+2*dx)]);
end;

procedure TfmMain.EditDrawMicromap(Sender: TObject; C: TCanvas; const ARect: TRect);
begin
  C.Pen.Color:= $c0c0c0;
  C.Brush.Color:= $eeeeee;
  C.Rectangle(ARect);
  C.TextOut(ARect.Left+2, ARect.Top+2, 'tst');
end;

procedure TfmMain.EditDrawTest(Sender: TObject; C: TCanvas; const ARect: TRect);
begin
  //Exit;
  C.Pen.Color:= clred;
  C.Brush.Style:= bsClear;
  C.Rectangle(ARect);
end;

procedure TfmMain.EditDrawGap(Sender: TObject; C: TCanvas; const ARect: TRect;
  AGap: TATSynGapItem);
begin
  ////DoPaintGap(C, ARect, AGap.LineIndex);
end;

procedure TfmMain.mnuFileOpenClick(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    InitialDir:= FFilesDir;
    if not Execute then Exit;
    DoOpen(FileName, true);
  end;
end;

procedure TfmMain.DoOpen(const fn: string; ADetectEnc: boolean);
begin
  Application.ProcessMessages;
  FFileName:= fn;
  Progress.Show;
  Progress.Position:= 0;

  ed.BeginUpdate;
  try
    if ADetectEnc then
      ed.Strings.EncodingCodepage:= '';
    ed.Strings.EncodingDetect:= ADetectEnc;
    ed.LoadFromFile(fn);
    ed.Strings.EncodingDetect:= true;
  finally
    ed.EndUpdate;
  end;

  Progress.Hide;
  Caption:= 'Demo - '+ExtractFileName(fn);
end;

procedure TfmMain.EditChanged(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TfmMain.bGotoClick(Sender: TObject);
const
  NIndentHorz=5;
  NIndentVert=5;
var
  s: string;
  n: integer;
begin
  s:= IntToStr(ed.LineTop+1);
  if not InputQuery('Go to', 'Line:', s) then Exit;
  if s='' then Exit;
  n:= StrToIntDef(s, 0)-1;
  if (n>=0) and (n<ed.Strings.Count) then
    ed.DoGotoPos(
      Point(0, n),
      Point(-1, -1),
      NIndentHorz,
      NIndentVert,
      true,
      true)
  else
    ShowMessage('Incorrect line index: '+s);
end;

procedure TfmMain.bClearLogClick(Sender: TObject);
begin
  ListboxLog.Items.Clear;
end;

procedure TfmMain.btnMarkerClick(Sender: TObject);
begin
  if ed.Carets.Count=1 then
  begin
    ed.Markers.Add(ed.Carets[0].PosX, ed.Carets[0].PosY);
    ed.Update;
  end;
end;

procedure TfmMain.btnStopClick(Sender: TObject);
begin
  FFindStopped:= true;
end;

procedure TfmMain.chkMinimapLeftChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptMinimapAtLeft:= chkMinimapLeft.Checked;
  ed.Update;
end;

procedure TfmMain.chkMinimapTooltipChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptMinimapTooltipVisible:= chkMinimapTooltip.Checked;
end;

procedure TfmMain.chkMouseEnChange(Sender: TObject);
begin
  ed.OptMouseEnableNormalSelection:= chkMouseEn.Checked;
  ed.OptMouseEnableColumnSelection:= chkMouseEn.Checked;
  ed.Update;
end;

procedure TfmMain.chkNewScrollChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptScrollbarsNew:= chkNewScroll.Checked;
  ed.Update;
end;

procedure TfmMain.chkTabSpacesChange(Sender: TObject);
begin
  if wait then exit;
  ed.OptTabSpaces:= chkTabSpaces.Checked;
  ed.Update;
end;

procedure TfmMain.FinderProgress(Sender: TObject; const ACurPos,
  AMaxPos: Int64; var AContinue: boolean);
begin
  progress.Position:= ACurPos * 100 div AMaxPos;
  Application.ProcessMessages;
  if FFindStopped then AContinue:= false;
end;

procedure TfmMain.MenuItem14Click(Sender: TObject);
begin

end;

procedure TfmMain.mnuFileExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.mnuFileHtmlClick(Sender: TObject);
var
  fn: string;
begin
  fn:= GetTempDir+DirectorySeparator+'_export.html';
  DoEditorExportToHTML(Ed, fn, 'Export test',
    'Courier New', 12, false,
    clWhite, clMedGray);
  if FileExists(fn) then
    OpenDocument(fn);
end;


procedure TfmMain.bFontClick(Sender: TObject);
begin
  with FontDialog1 do
  begin
    Font:= ed.Font;
    if Execute then
    begin
      ed.Font.Assign(Font);
      ed.Update;
    end;
  end;
  ed.SetFocus;
end;

procedure TfmMain.bAddCrtClick(Sender: TObject);
var
  i, j: integer;
begin
  for j:= 1 to 100 do
    for i:= 1 to 20 do
      ed.Carets.Add(i*2, j);
  ed.Carets.Sort;
  ed.Update;
  UpdateStatus;
end;

procedure TfmMain.mnuFileSaveAsClick(Sender: TObject);
begin
  with SaveDialog1 do
  begin
    InitialDir:= FFilesDir;
    FileName:= '';
    if Execute then
    begin
      ed.SaveToFile(FileName);
      ed.Update;
    end;
  end;
end;

procedure TfmMain.bKeymapClick(Sender: TObject);
var
  Cmd: integer;
begin
  Cmd:= DoCommandDialog(ed);
  if Cmd>0 then
  begin
    ed.DoCommand(Cmd);
    ed.Update;
  end;
end;

procedure TfmMain.bOptClick(Sender: TObject);
begin
  DoConfigEditor(ed);

  wait:= true;
  chkUnprintVis.Checked:= ed.OptUnprintedVisible;
  chkUnprintSp.Checked:= ed.OptUnprintedSpaces;
  chkUnprintEnd.Checked:= ed.OptUnprintedEnds;
  chkUnprintEndDet.Checked:= ed.OptUnprintedEndsDetails;
  wait:= false;

  ed.SetFocus;
end;

procedure TfmMain.mnuFileSaveClick(Sender: TObject);
begin
  if FFileName='' then exit;
  ed.SaveToFile(FFileName);
  ed.Update;
end;

procedure TfmMain.mnuFindClick(Sender: TObject);
var
  res: TModalResult;
  cnt: integer;
  ok, fchanged: boolean;
begin
  with TfmFind.Create(nil) do
  try
    edFind.Text:= Utf8Encode(FFinder.StrFind);
    edRep.Text:= Utf8Encode(FFinder.StrReplace);
    chkBack.Checked:= FFinder.OptBack;
    chkCase.Checked:= FFinder.OptCase;
    chkWords.Checked:= FFinder.OptWords;
    chkRegex.Checked:= FFinder.OptRegex;
    chkFromCaret.Checked:= FFinder.OptFromCaret;
    chkConfirm.Checked:= FFinder.OptConfirmReplace;
    chkInSel.Enabled:= ed.Carets.IsSelection;

    res:= ShowModal;
    if res=mrCancel then Exit;
    if edFind.Text='' then Exit;

    FFinder.StrFind:= Utf8Decode(edFind.Text);
    FFinder.StrReplace:= Utf8Decode(edRep.Text);
    FFinder.OptBack:= chkBack.Checked;
    FFinder.OptCase:= chkCase.Checked;
    FFinder.OptWords:= chkWords.Checked;
    FFinder.OptRegex:= chkRegex.Checked;
    FFinder.OptFromCaret:= chkFromCaret.Checked;
    FFinder.OptConfirmReplace:= chkConfirm.Checked;
    FFinder.OptInSelection:= chkInSel.Checked;

    FFindStopped:= false;
    FFindConfirmAll:= mrNone;
    FFindMarkAll:= false;
    btnStop.Show;
    progress.Show;
    progress.Position:= 0;

    case res of
      mrOk: //find
        begin
          ok:= FFinder.DoAction_FindOrReplace(false, false, false, fchanged);
          FinderUpdateEditor(false);
          if not ok then DoFindError;
        end;
      mrYes: //replace
        begin
          ok:= FFinder.DoAction_FindOrReplace(false, true, false, fchanged);
          FinderUpdateEditor(true);
          if not ok then DoFindError;
        end;
      mrYesToAll: //replace all
        begin
          cnt:= FFinder.DoAction_ReplaceAll;
          FinderUpdateEditor(true);
          MsgStatus('Replaces made: '+Inttostr(cnt));
        end;
      mrIgnore: //count all
        begin
          cnt:= FFinder.DoAction_CountAll(false);
          MsgStatus('Count of "'+FFinder.StrFind+'": '+Inttostr(cnt));
        end;
      mrRetry: //mark all
        begin
          FFindMarkAll:= true;
          ed.Markers.Clear;
          cnt:= FFinder.DoAction_CountAll(true);
          FFindMarkAll:= false;
          FinderUpdateEditor(false);
          MsgStatus('Markers placed: '+Inttostr(cnt));
        end;
    end;
  finally
    Free;
  end;

  btnStop.Hide;
  progress.Hide;
end;

procedure TfmMain.mnuFindNextClick(Sender: TObject);
var
  ok, fchanged: boolean;
begin
  if FFinder.StrFind='' then
  begin
    mnuFind.Click;
    Exit
  end;

  FFinder.OptFromCaret:= true;
  ok:= FFinder.DoAction_FindOrReplace(false, false, false, fchanged);
  FinderUpdateEditor(false);
  if not ok then DoFindError;
end;

procedure TfmMain.mnuTestGapAddClick(Sender: TObject);
var
  Vals: array[0..1] of string;
  NLine, NSize: integer;
  b: TBitmap;
begin
  Vals[0]:= '2';
  Vals[1]:= '60';
  if not InputQuery('Add gap (sets last_line_on_top)',
    ['Line number', 'Gap size (pixels)'],
    Vals) then exit;

  NLine:= StrToInt(Vals[0]);
  NSize:= StrToInt(Vals[1]);

  b:= TBitmap.Create;
  b.PixelFormat:= pf24bit;
  b.SetSize(500, NSize-4);
  DoPaintGap(b.Canvas, Rect(0, 0, b.Width, b.Height), NLine);

  if not ed.Gaps.Add(NLine-1, NSize, b, 0) then
  begin
    ShowMessage(Format('Not correct line index (%d) or size (%d)', [NLine, NSize]));
    exit;
  end;

  if ed.Gaps.Count=1 then
    FGapInitSize:= NSize;

  ed.OptLastLineOnTop:= true;
  ed.Update;
  UpdateGapPanel;
end;

procedure TfmMain.mnuTestGapClearClick(Sender: TObject);
begin
  ed.Gaps.Clear;
  ed.Update;
  UpdateGapPanel;
end;

procedure TfmMain.mnuTestGapPanelsClick(Sender: TObject);
begin
  with mnuTestGapPanels do
    Checked:= not Checked;
  UpdateGapPanel;
end;

procedure TfmMain.mnuTestSyntaxClick(Sender: TObject);
begin
  mnuTestSyntax.Checked:= not mnuTestSyntax.Checked;
  if mnuTestSyntax.Checked then
    ed.OnCalcHilite:= @EditCalcLine
  else
    ed.OnCalcHilite:= nil;
  ed.Update;
end;

procedure TfmMain.TimerHintTimer(Sender: TObject);
begin
  TimerHint.Enabled:= false;
  StatusMsg.SimpleText:= '';
end;

procedure TfmMain.DoSetEnc(const Str: string);
begin
  if Str=sEncAnsi then
  begin
    Ed.Strings.Encoding:= cEncAnsi;
    Ed.Strings.EncodingCodepage:= '';
  end
  else
  if Str=sEncUtf8 then
  begin
    Ed.Strings.Encoding:= cEncUTF8;
    Ed.Strings.SaveSignUtf8:= true;
    Ed.Strings.EncodingCodepage:= '';
  end
  else
  if Str=sEncUtf8NoBom then
  begin
    Ed.Strings.Encoding:= cEncUTF8;
    Ed.Strings.SaveSignUtf8:= false;
    Ed.Strings.EncodingCodepage:= '';
  end
  else
  if Str=sEncUtf16LE then
  begin
    Ed.Strings.Encoding:= cEncWideLE;
    Ed.Strings.EncodingCodepage:= '';
  end
  else
  if Str=sEncUtf16BE then
  begin
    Ed.Strings.Encoding:= cEncWideBE;
    Ed.Strings.EncodingCodepage:= '';
  end
  else
  begin
    Ed.Strings.Encoding:= cEncAnsi;
    Ed.Strings.EncodingCodepage:= Str;
  end;

  if FFileName<>'' then
    if Application.Messagebox('Encoding changed in mem. Also reload file in this encoding?',
      'Editor', MB_OKCANCEL or MB_ICONQUESTION) = id_ok then
      DoOpen(FFileName, false);
end;

procedure TfmMain.DoAddEnc(Sub, SName: string);
var
  mi, miSub: TMenuItem;
  n: integer;
  subEnc: TMenuItem;
begin
  subEnc:= mnuEnc;
  miSub:= nil;
  if Sub<>'' then
  begin
    n:= subEnc.IndexOfCaption(Sub);
    if n<0 then
    begin
      mi:= TMenuItem.Create(Self);
      mi.Caption:= Sub;
      subEnc.Add(mi);
      n:= subEnc.IndexOfCaption(Sub);
    end;
    miSub:= subEnc.Items[n]
  end;
  if miSub=nil then miSub:= subEnc;
  mi:= TMenuItem.Create(Self);
  mi.Caption:= SName;
  mi.OnClick:= @MenuEncClick;
  miSub.Add(mi);
end;


procedure TfmMain.DoLog(const S: string);
begin
  ListboxLog.Items.Add(S);
  ListboxLog.ItemIndex:= ListboxLog.Items.Count-1;
end;

procedure TfmMain.EditHotspotEnter(Sender: TObject; AHotspotIndex: integer);
begin
  DoLog('OnHotspotEnter: '+IntToStr(AHotspotIndex));
end;

procedure TfmMain.EditHotspotExit(Sender: TObject; AHotspotIndex: integer);
begin
  DoLog('OnHotspotExit: '+IntToStr(AHotspotIndex));
end;

procedure TfmMain.EditStringsChangeBlock(Sender: TObject; const AStartPos,
  AEndPos: TPoint; AChange: TATBlockChangeKind; ABlock: TStringList);
const
  cEvent: array[TATBlockChangeKind] of string = (
    'cBlockDeleteLines',
    'cBlockInsertLines',
    'cBlockDeleteColumn',
    'cBlockInsertColumn'
    );
begin
  DoLog(Format('%s, %d..%d', [
    cEvent[AChange],
    AStartPos.Y,
    AEndPos.Y
    ]));
end;

procedure TfmMain.EditClickGap(Sender: TObject; AGapItem: TATSynGapItem;
  APos: TPoint);
begin
  if Assigned(AGapItem) then
    MsgStatus(Format('OnClickGap: line %d, pos %d:%d',
      [AGapItem.LineIndex+1, APos.X, APos.Y]));
end;

procedure TfmMain.EditStringsChange(Sender: TObject; ALine: integer;
  AChange: TATLineChangeKind);
const
  cEvent: array[TATLineChangeKind] of string = (
    'cLineChangeEdited',
    'cLineChangeAdded',
    'cLineChangeDeleted',
    'cLineChangeDeletedAll'
    );
begin
  DoLog(Format('%s, line %d', [
    cEvent[AChange],
    ALine
    ]));
end;

procedure TfmMain.MenuEncClick(Sender: TObject);
begin
  DoSetEnc((Sender as TMenuItem).Caption);
end;


procedure TfmMain.UpdateEnc;
begin
  mnuEnc.Clear;

  DoAddEnc('', sEncAnsi);
  DoAddEnc('', sEncUtf8);
  DoAddEnc('', sEncUtf8NoBom);
  DoAddEnc('', sEncUtf16LE);
  DoAddEnc('', sEncUtf16BE);
  DoAddEnc('', '-');

  DoAddEnc('Europe', 'CP1250');
  DoAddEnc('Europe', 'CP1251');
  DoAddEnc('Europe', 'CP1252');
  DoAddEnc('Europe', 'CP1253');
  DoAddEnc('Europe', 'CP1257');
  DoAddEnc('Europe', '-');
  DoAddEnc('Europe', 'CP437');
  DoAddEnc('Europe', 'CP850');
  DoAddEnc('Europe', 'CP852');
  DoAddEnc('Europe', 'CP866');
  DoAddEnc('Europe', '-');
  DoAddEnc('Europe', 'ISO-8859-1');
  DoAddEnc('Europe', 'ISO-8859-2');
  DoAddEnc('Europe', 'Macintosh');

  DoAddEnc('Other', 'CP1254');
  DoAddEnc('Other', 'CP1255');
  DoAddEnc('Other', 'CP1256');

  DoAddEnc('Asian', 'CP874');
  DoAddEnc('Asian', 'CP932');
  DoAddEnc('Asian', 'CP936');
  DoAddEnc('Asian', 'CP949');
  DoAddEnc('Asian', 'CP950');
  DoAddEnc('Asian', 'CP1258');
end;

procedure TfmMain.mnuHelpMousClick(Sender: TObject);
const
  txt =
    'Ctrl+click - add/del caret'#13+
    'Ctrl+drag - add caret with selection'#13+
    'Ctrl+Shift+click - add carets as column'#13+
    #13+
    'Alt+drag - column-select (looks weird with wrap, ignores tab-width)'#13+
    'drag on line numbers - line-select'#13+
    'Shift+wheel - horiz scroll'#13;
begin
  Showmessage(txt);
end;

procedure TfmMain.chkGutterChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptGutterVisible:= chkGutter.Checked;
  ed.Update;
end;

procedure TfmMain.chkMicromapChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptMicromapVisible:= chkMicromap.Checked;
  ed.Update;
end;

procedure TfmMain.chkMinimapChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptMinimapVisible:= chkMinimap.Checked;
  ed.Update;
end;

procedure TfmMain.mnuBmsClick(Sender: TObject);
begin
  mnuTestBookmkClick(Self);
end;

procedure TfmMain.mnuShowPaneClick(Sender: TObject);
begin
  with mnuShowPane do
  begin
    Checked:= not Checked;
    PanelRt.Visible:= Checked;
  end;
end;

procedure TfmMain.chkRulerChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptRulerVisible:= chkRuler.Checked;
  ed.Update;
end;

procedure TfmMain.chkUnprintVisChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptUnprintedVisible:= chkUnprintVis.Checked;
  ed.Update;
end;

procedure TfmMain.chkUnprintEndChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptUnprintedEnds:= chkUnprintEnd.Checked;
  ed.Update;
end;

procedure TfmMain.chkUnprintEndDetChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptUnprintedEndsDetails:= chkUnprintEndDet.Checked;
  ed.Update;
end;

procedure TfmMain.chkUnprintSpChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptUnprintedSpaces:= chkUnprintSp.Checked;
  ed.Update;
end;

procedure TfmMain.chkWrapMarginChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptWrapMode:= cWrapAtMargin;
end;

procedure TfmMain.chkWrapOffChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptWrapMode:= cWrapOff;
end;

procedure TfmMain.chkWrapOnChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptWrapMode:= cWrapOn;
end;

procedure TfmMain.chkWrapIndentChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptWrapIndented:= chkWrapIndent.Checked;
  ed.Update;
end;

procedure TfmMain.edFontsizeChange(Sender: TObject);
begin
  if wait then Exit;
  ed.Font.Size:= edFontsize.Value;
  ed.Update(true);
end;

procedure TfmMain.edMarginFixedChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptMarginRight:= edMarginFixed.Value;
  ed.Update;
end;

procedure TfmMain.edSpaceXChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptCharSpacingX:= edSpaceX.Value;
  ed.Update;
end;

procedure TfmMain.edSpaceYChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptCharSpacingY:= edSpaceY.Value;
  ed.Update;
end;

procedure TfmMain.edTabsizeChange(Sender: TObject);
begin
  if wait then Exit;
  ed.OptTabSize:= edTabsize.Value;
  ed.Update;
end;

procedure TfmMain.EditDrawLine(Sender: TObject; C: TCanvas;
  AX, AY: integer; const AStr: atString; ACharSize: TPoint; const AExtent: TATIntArray);
var
  X1, X2, Y, i: integer;
begin
  if AStr='' then Exit;
  if not mnuTestHiliteWww.Checked then Exit;

  C.Pen.Color:= clBlue;
  C.Pen.Width:= 2;
  C.Pen.EndCap:= pecSquare;

  for i:= 1 to Length(AStr) do
    if AStr[i]='w' then
    begin
      X1:= AX;
      if i>1 then
        Inc(X1, AExtent[i-2]);
      X2:= AX+AExtent[i-1];
      Y:= AY+ACharSize.Y-1;

      C.Line(X1, Y, X2, Y);
    end;

  C.Pen.Width:= 1;
end;

procedure TfmMain.EditCalcLine(Sender: TObject; var AParts: TATLineParts;
  ALineIndex, ACharIndex, ALineLen: integer; var AColorAfterEol: TColor);
var
  nlen, npart, noffset: integer;
  kind, kindnew: integer;
  //
  procedure Add;
  begin
    if npart>High(AParts) then exit;
    with AParts[npart] do
    begin
      ColorBG:= clNone;
      case kind of
        1: begin
             ColorFont:= clblue;
           end;
        2: begin
             ColorFont:= clgreen;
             ColorBorder:= clgreen;
             BorderDown:= cLineStyleRounded;
             BorderUp:= cLineStyleRounded;
             BorderLeft:= cLineStyleRounded;
             BorderRight:= cLineStyleRounded;
             FontItalic:= true;
             FontBold:= true;
           end;
        3: begin
             ColorFont:= clred;
             Colorbg:= clyellow;
             ColorBorder:= clred;
             BorderDown:= cLineStyleWave;
             //BorderLeft:= cLineDotted;
             //BorderRight:= cLineRounded;
             //BorderUp:= cLineRounded;
          end;
        else
          begin
            ColorFont:= clgray;
          end;
      end;
      Offset:= noffset;
      Len:= nlen;
    end;
    inc(npart);
  end;
  //
var
  Str: atString;
  i: integer;
begin
  Str:= Copy(ed.Strings.Lines[ALineIndex], ACharIndex, ALineLen);

  npart:= 0;
  noffset:= 0;
  nlen:= 1;
  kind:= -1;

  for i:= 1 to Length(Str) do
  begin
    case Str[i] of
      'w': kindnew:= 1;
      'e': kindnew:= 2;
      '0'..'9': kindnew:= 3;
      else kindnew:= 0;
    end;

    if kindnew=kind then
    begin
      inc(nlen);
      Continue;
    end;
    if kind>=0 then Add;
    kind:= kindnew;
    nlen:= 1;
    noffset:= i-1;
  end;

  Add;

  //test
  //AParts[0].Colorbg:= clgreen;
  //AParts[1].Colorbg:= clyellow;
end;

procedure TfmMain.MsgStatus(const S: string);
begin
  StatusMsg.SimpleText:= S;
  TimerHint.Enabled:= false;
  TimerHint.Enabled:= true;
end;

procedure TfmMain.DoFindError;
begin
  MsgStatus('Cannot find: '+FFinder.StrFind);
end;

procedure TfmMain.FinderConfirmReplace(Sender: TObject; APos1, APos2: TPoint;
  AForMany: boolean; var AConfirm, AContinue: boolean);
var
  Res: TModalResult;
  Buttons: TMsgDlgButtons;
begin
  case FFindConfirmAll of
    mrYesToAll: begin AConfirm:= true; exit end;
    mrNoToAll: begin AConfirm:= false; exit end;
  end;

  with Ed.Carets[0] do
  begin
    PosX:= APos1.X;
    PosY:= APos1.Y;
    EndX:= APos2.X;
    EndY:= APos2.Y;        end;
  Ed.DoCommand(cCommand_ScrollToCaretTop);
  Ed.Update(true);

  Buttons:= [mbYes, mbNo];
  if AForMany then
    Buttons:= Buttons+[mbYesToAll, mbNoToAll];
  //Str:= Ed.Strings.TextSubstring(APos1.X, APos1.Y, APos2.X, APos2.Y);
  Res:= MessageDlg(
    'Confirm replace',
    'Replace string at line '+Inttostr(APos1.Y+1),
    mtConfirmation,
    Buttons, '');

  AConfirm:= Res in [mrYes, mrYesToAll];
  AContinue:= Res<>mrNoToAll;
  if Res in [mrYesToAll, mrNoToAll] then
    FFindConfirmAll:= Res;
end;


procedure TfmMain.FinderBadRegex(Sender: TObject);
begin
  Application.MessageBox(
    PChar('Incorrect regex passed:'#13+Utf8Encode(FFinder.StrFind)),
    PChar(Application.Title),
    mb_ok or mb_iconerror);
end;

procedure TfmMain.FinderUpdateEditor(AUpdateText: boolean);
begin
  FFinder.Editor.Update(AUpdateText);
  FFinder.Editor.DoGotoCaret(cEdgeTop);
  UpdateStatus;
end;

procedure TfmMain.FinderFound(Sender: TObject; APos1, APos2: TPoint);
begin
  if FFindMarkAll then
  begin
    ed.Markers.Add(APos1.X, APos1.Y, 0, Abs(APos2.X-APos1.X), 0);
  end;
end;

procedure TfmMain.UpdateGapPanel;
var
  R: TRect;
begin
  if not mnuTestGapPanels.Checked then
  begin
    ed_gap.Hide;
    exit
  end;

  if not ed.DoGetGapRect(0, R) then
  begin
    ed_gap.Hide;
    exit
  end;

  ed_gap.SetBounds(R.Left, R.Top, R.Right-R.Left, R.Bottom-R.Top);
  ed_gap.Show;
end;

procedure TfmMain.EditorGapChange(Sender: TObject);
var
  NLines: integer;
begin
  NLines:= ed_gap.Strings.Count+1;
  ed_gap.Height:= Max(FGapInitSize, NLines*ed_gap.TextCharSize.Y);
  ed.Gaps[0].Size:= ed_gap.Height;
  ed.Update;
end;

procedure TfmMain.EditorGapDelete(Sender: TObject; ALineIndex: integer);
begin
  //ShowMessage('delete gap '+IntToStr(ALineIndex));
end;


end.
