{
Copyright (C) Alexey Torgashin, uvviewsoft.com
License: MPL 2.0 or LGPL
}
unit ATStringProc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StrUtils,
  LCLType, LCLIntf, Clipbrd,
  UnicodeData,
  ATSynEdit_CharSizer;

type
  atString = UnicodeString;
  atChar = WideChar;
  PatChar = PWideChar;

type
  TATIntArray = array of integer;
  TATPointArray = array of TPoint;
  TATLineOffsetsInfo = array of integer; //word is too small

function SCharUpper(ch: atChar): atChar;
function SCharLower(ch: atChar): atChar;
function SCaseTitle(const S, SWordChars: atString): atString;
function SCaseInvert(const S: atString): atString;
function SCaseSentence(const S, SWordChars: atString): atString;

{$Z1}
type
  TATLineEnds = (cEndNone, cEndWin, cEndUnix, cEndMac);
const
  cLineEndStrings: array[TATLineEnds] of string = ('', #13#10, #10, #13);
  cLineEndNiceNames: array[TATLineEnds] of string = ('', 'win', 'un', 'mac');
  cLineEndLength: array[TATLineEnds] of Byte = (0, 2, 1, 1);

var
  OptMaxTabPositionToExpand: integer = 500; //no sense to expand too far tabs
  OptMinWordWrapOffset: integer = 3;
  OptCommaCharsWrapWithWords: UnicodeString = '.,;:''"`~?!&%$';


function IsCharEol(ch: atChar): boolean;
function IsCharWord(ch: atChar; const AWordChars: atString): boolean;
function IsCharSpace(ch: atChar): boolean;
function IsStringWithUnicodeChars(const S: atString): boolean;
function IsStringSpaces(const S: atString): boolean;
function IsStringSpaces(const S: atString; AFrom, ALen: integer): boolean;

function SBeginsWith(const S, SubStr: atString): boolean;
function SBeginsWith(const S, SubStr: string): boolean;
function SEndsWith(const S, SubStr: atString): boolean;
function SEndsWith(const S, SubStr: string): boolean;
function SEndsWithEol(const S: string): boolean;
function SEndsWithEol(const S: atString): boolean;

function STrimRight(const S: atString): atString;
function SGetIndentChars(const S: atString): integer;
function SGetIndentExpanded(const S: atString; ATabSize: integer): integer;
function SGetIndentCharsToOpeningBracket(const S: atString): integer;
function SGetNonSpaceLength(const S: atString): integer;

function STabsToSpaces(const S: atString; ATabSize: integer): atString;
function STabsToSpaces_Length(const S: atString; ATabSize: integer; AMaxLen: integer=-1): integer;
function SSpacesToTabs(const S: atString; ATabSize: integer): atString;
function SCharPosToColumnPos(const S: atString; APos, ATabSize: integer): integer;
function SColumnPosToCharPos(const S: atString; AColumn, ATabSize: integer): integer;

function SStringHasTab(const S: atString): boolean;
function SStringHasTab(const S: string): boolean;
function SStringHasAsciiAndNoTabs(const S: atString): boolean;
function SStringHasAsciiAndNoTabs(const S: string): boolean;

function SRemoveNewlineChars(const S: atString): atString;
function SRemoveHexChars(const S: atString): atString;
function SRemoveAsciiControlChars(const S: atString; AReplaceChar: Widechar): atString;

procedure SCalcCharOffsets(const S: atString; var AInfo: TATLineOffsetsInfo;
  ATabSize: integer; ACharsSkipped: integer = 0);
function SFindWordWrapOffset(const S: atString; AColumns, ATabSize: integer;
  const AWordChars: atString; AWrapIndented: boolean): integer;
function SFindClickedPosition(const Str: atString;
  APixelsFromLeft, ACharSize, ATabSize: integer;
  AAllowVirtualPos: boolean;
  out AEndOfLinePos: boolean): integer;
procedure SFindOutputSkipOffset(const S: atString; ATabSize, AScrollPos: integer;
  out ACharsSkipped: integer; out ASpacesSkipped: integer);

function SIndentUnindent(const Str: atString; ARight: boolean;
  AIndentSize, ATabSize: integer;
  ATabSpaces: boolean): atString;
function SGetItem(var S: string; const sep: Char = ','): string;
function SGetItemAtEnd(var S: string; const sep: Char = ','): string;
function SSwapEndian(const S: UnicodeString): UnicodeString;
function SWithBreaks(const S: atString): boolean;
procedure SAddStringToHistory(const S: string; List: TStrings; MaxItems: integer);

function BoolToPlusMinusOne(b: boolean): integer;
procedure TrimStringList(L: TStringList);

type
  TATDecodeRec = record SFrom, STo: UnicodeString; end;
function SDecodeRecords(const S: UnicodeString; const Decode: array of TATDecodeRec): UnicodeString;
function SConvertUtf8ToWideForAscii(const S: string): UnicodeString;

procedure SReplaceAll(var s: string; const SFrom, STo: string);
procedure SReplaceAllPercentChars(var S: string);
procedure SReplaceAllTabsToOneSpace(var S: string);
procedure SDeleteFrom(var s: string; const SFrom: string);
procedure SDeleteFrom(var s: atString; const SFrom: atString);
procedure SDeleteFromEol(var s: string);
procedure SDeleteFromEol(var s: atString);

procedure SClipboardCopy(AText: string; AClipboardObj: TClipboard=nil);


implementation

uses
  Dialogs, Math;

function IsCharEol(ch: atChar): boolean; inline;
begin
  Result:= (ch=#10) or (ch=#13);
end;

function IsCharWord(ch: atChar; const AWordChars: atString): boolean;
var
  NType: byte;
begin
  case ch of
    '0'..'9',
    'a'..'z',
    'A'..'Z',
    '_':
      exit(true);
  end;

  if Ord(ch)<128 then
    Result:= false
  else
  if Ord(ch)>=LOW_SURROGATE_BEGIN then
    exit(false)
  else
  begin
    NType:= GetProps(Ord(ch))^.Category;
    Result:= (NType<=UGC_OtherNumber);
  end;

  if not Result then
    if AWordChars<>'' then
      if Pos(ch, AWordChars)>0 then
        Result:= true;
end;

function IsCharSpace(ch: atChar): boolean;
begin
  Result:=
    (ch=' ') or //space
    (ch=#9) or //tab
    (ch=#$A0) or //no-break space, NBSP, often used on macOS
    (ch=#$2007) or //figure space
    (ch=#$200B) or //zero width space https://en.wikipedia.org/wiki/Zero-width_space
    (ch=#$202F); //narrow no-break space
end;

function IsStringSpaces(const S: atString): boolean;
begin
  Result:= IsStringSpaces(S, 1, Length(S));
end;

function IsStringSpaces(const S: atString; AFrom, ALen: integer): boolean;
var
  NLen, i: integer;
begin
  Result:= true;
  NLen:= Length(S);
  for i:= AFrom to AFrom+ALen-1 do
  begin
    if i>NLen then exit;
    if not IsCharSpace(S[i]) then exit(false);
  end;
end;

function IsStringWithUnicodeChars(const S: atString): boolean;
var
  i, N: integer;
begin
  Result:= false;
  for i:= 1 to Length(S) do
  begin
    N:= Ord(S[i]);
    if (N<32) or (N>126) then exit(true);
  end;
end;


procedure DoDebugOffsets(const AList: TATLineOffsetsInfo);
var
  i: integer;
  s: string;
begin
  s:= '';
  for i:= Low(AList) to High(AList) do
    s:= s+IntToStr(AList[i])+'% ';
  ShowMessage('Offsets'#10+s);
end;

function SFindWordWrapOffset(const S: atString; AColumns, ATabSize: integer;
  const AWordChars: atString; AWrapIndented: boolean): integer;
  //
  //override IsCharWord to check also commas,dots,quotes
  //to wrap them with wordchars
  function _IsWord(ch: atChar): boolean;
  begin
    Result:= IsCharWord(ch, AWordChars+OptCommaCharsWrapWithWords);
  end;
  //
var
  N, NMin, NAvg: integer;
  Offsets: TATLineOffsetsInfo;
begin
  if S='' then
    begin Result:= 0; Exit end;
  if AColumns<OptMinWordWrapOffset then
    begin Result:= AColumns; Exit end;

  SCalcCharOffsets(S, Offsets, ATabSize);

  if Offsets[High(Offsets)]<=AColumns*100 then
  begin
    Result:= Length(S);
    Exit
  end;

  //NAvg is average wrap offset, we use it if no correct offset found
  N:= Length(S)-1;
  while (N>0) and (Offsets[N]>(AColumns+1)*100) do Dec(N);
  NAvg:= N;
  if NAvg<OptMinWordWrapOffset then
    begin Result:= OptMinWordWrapOffset; Exit end;

  //find correct offset: not allowed at edge
  //a) 2 wordchars,
  //b) space as 2nd char (not nice look for Python src)
  NMin:= SGetIndentChars(S)+1;
  while (N>NMin) and
    ((_IsWord(S[N]) and _IsWord(S[N+1])) or
     (AWrapIndented and IsCharSpace(S[N+1])))
    do Dec(N);

  //use correct of avg offset
  if N>NMin then
    Result:= N
  else
    Result:= NAvg;
end;

function SGetIndentChars(const S: atString): integer;
begin
  Result:= 0;
  while (Result<Length(S)) and IsCharSpace(S[Result+1]) do
    Inc(Result);
end;

function SGetIndentCharsToOpeningBracket(const S: atString): integer;
var
  n: integer;
begin
  Result:= 0;
  n:= RPos('(', S);
  if n>0 then
    //test that found bracket is not closed
    if PosEx(')', S, n)=0 then
      Result:= n;
end;

function SGetNonSpaceLength(const S: atString): integer;
begin
  Result:= Length(S);
  while (Result>0) and IsCharSpace(S[Result]) do Dec(Result);
  if Result=0 then
    Result:= Length(S);
end;

function SGetIndentExpanded(const S: atString; ATabSize: integer): integer;
var
  SIndent: atString;
begin
  SIndent:= Copy(S, 1, SGetIndentChars(S));
  Result:= STabsToSpaces_Length(SIndent, ATabSize);
end;

function SSwapEndian(const S: UnicodeString): UnicodeString;
var
  i: integer;
  p: PWord;
begin
  Result:= S;
  if S='' then exit;
  UniqueString(Result);
  P:= PWord(@Result[1]);
  for i:= 1 to Length(Result) do
  begin
    P^:= SwapEndian(P^);
    Inc(P);
  end;
end;

function SCalcTabulationSize(const ATabSize, APos: integer): integer;
begin
  Result:= 1;
  if APos>OptMaxTabPositionToExpand then Exit;
  while (APos+Result-1) mod ATabSize <> 0 do
    Inc(Result);
end;


function STabsToSpaces(const S: atString; ATabSize: integer): atString;
var
  N, NSize: integer;
begin
  Result:= S;
  repeat
    N:= Pos(#9, Result);
    if N=0 then Break;
    NSize:= SCalcTabulationSize(ATabSize, N);
    if NSize<=1 then
      Result[N]:= ' '
    else
    begin
      Delete(Result, N, 1);
      Insert(StringOfChar(' ', NSize), Result, N);
    end;
  until false;
end;

function STabsToSpaces_Length(const S: atString; ATabSize: integer; AMaxLen: integer=-1): integer;
var
  i: integer;
begin
  Result:= 0;
  if AMaxLen<0 then
    AMaxLen:= Length(S);
  for i:= 1 to AMaxLen do
    if S[i]<>#9 then
      Inc(Result)
    else
      Inc(Result, SCalcTabulationSize(ATabSize, Result+1));
end;




procedure SCalcCharOffsets(const S: atString;
  var AInfo: TATLineOffsetsInfo;
  ATabSize: integer; ACharsSkipped: integer);
var
  NSize, NTabSize, NCharsSkipped: integer;
  NScalePercents: integer;
  ch: widechar;
  i: integer;
begin
  SetLength(AInfo, Length(S));
  if S='' then Exit;

  NCharsSkipped:= ACharsSkipped;

  for i:= 1 to Length(S) do
  begin
    ch:= S[i];
    Inc(NCharsSkipped);

    NScalePercents:= GlobalCharSizer.GetCharWidth(ch);

    if ch<>#9 then
      NSize:= 1
    else
    begin
      NTabSize:= SCalcTabulationSize(ATabSize, NCharsSkipped);
      NSize:= NTabSize;
      Inc(NCharsSkipped, NTabSize-1);
    end;

    if (i<Length(S)) and IsCharAccent(S[i+1]) then
      NSize:= 0;

    if i=1 then
      AInfo[i-1]:= NSize*NScalePercents
    else
      AInfo[i-1]:= AInfo[i-2]+NSize*NScalePercents;
  end;
end;

function SFindClickedPosition(const Str: atString;
  APixelsFromLeft, ACharSize, ATabSize: integer;
  AAllowVirtualPos: boolean;
  out AEndOfLinePos: boolean): integer;
var
  ListOffsets: TATLineOffsetsInfo;
  ListEnds, ListMid: TATIntArray;
  i: integer;
begin
  AEndOfLinePos:= false;
  if Str='' then
  begin
    if AAllowVirtualPos then
      Result:= 1+APixelsFromLeft div ACharSize
    else
      Result:= 1;
    Exit;
  end;

  SetLength(ListEnds, Length(Str));
  SetLength(ListMid, Length(Str));
  SCalcCharOffsets(Str, ListOffsets, ATabSize);

  //positions of each char end
  for i:= 0 to High(ListEnds) do
    ListEnds[i]:= ListOffsets[i]*ACharSize div 100;

  //positions of each char middle
  for i:= 0 to High(ListEnds) do
    if i=0 then
      ListMid[i]:= ListEnds[i] div 2
    else
      ListMid[i]:= (ListEnds[i-1]+ListEnds[i]) div 2;

  for i:= 0 to High(ListEnds) do
    if APixelsFromLeft<ListMid[i] then
    begin
      Result:= i+1;
      Exit
    end;

  AEndOfLinePos:= true;
  if AAllowVirtualPos then
    Result:= Length(Str)+1 + (APixelsFromLeft - ListEnds[High(ListEnds)]) div ACharSize
  else
    Result:= Length(Str)+1;
end;

procedure SFindOutputSkipOffset(const S: atString; ATabSize, AScrollPos: integer;
  out ACharsSkipped: integer; out ASpacesSkipped: integer);
var
  Offsets: TATLineOffsetsInfo;
begin
  ACharsSkipped:= 0;
  ASpacesSkipped:= 0;
  if (S='') or (AScrollPos=0) then Exit;

  SCalcCharOffsets(S, Offsets, ATabSize);

  while (ACharsSkipped<Length(S)) and
    (Offsets[ACharsSkipped] < AScrollPos*100) do
    Inc(ACharsSkipped);

  if (ACharsSkipped>0) then
    ASpacesSkipped:= Offsets[ACharsSkipped-1] div 100;
end;


function BoolToPlusMinusOne(b: boolean): integer;
begin
  if b then Result:= 1 else Result:= -1;
end;

function SGetItem(var S: string; const sep: Char = ','): string;
var
  i: integer;
begin
  i:= Pos(sep, s);
  if i=0 then i:= MaxInt;
  Result:= Copy(s, 1, i-1);
  Delete(s, 1, i);
end;

function SGetItemAtEnd(var S: string; const sep: Char = ','): string;
var
  i: integer;
begin
  Result:= '';
  i:= Pos(sep, S);
  if i>0 then
  begin
    Result:= Copy(S, i+1, MaxInt);
    Delete(S, i, MaxInt);
  end;
end;

procedure TrimStringList(L: TStringList);
begin
  //dont do "while", we need correct last empty lines
  if (L.Count>0) and (L[L.Count-1]='') then
    L.Delete(L.Count-1);
end;

function SWithBreaks(const S: atString): boolean;
begin
  Result:=
    (Pos(#13, S)>0) or
    (Pos(#10, S)>0);
end;

function SSpacesToTabs(const S: atString; ATabSize: integer): atString;
begin
  Result:= StringReplace(S, StringOfChar(' ', ATabSize), #9, [rfReplaceAll]);
end;

function SCharPosToColumnPos(const S: atString; APos, ATabSize: integer): integer;
begin
  if APos>Length(S) then
    Result:= STabsToSpaces_Length(S, ATabSize) + APos-Length(S)
  else
    Result:= STabsToSpaces_Length(S, ATabSize, APos);
end;

function SColumnPosToCharPos(const S: atString; AColumn, ATabSize: integer): integer;
var
  size, i: integer;
begin
  if AColumn=0 then exit(AColumn);
  if Pos(#9, S)=0 then exit(AColumn);

  size:= 0;
  for i:= 1 to Length(S) do
  begin
    if S[i]<>#9 then
      Inc(size)
    else
      Inc(size, SCalcTabulationSize(ATabSize, size+1));
    if size>=AColumn then
      exit(i);
  end;

  Result:= AColumn - STabsToSpaces_Length(S, ATabSize) + Length(S);
end;

function SStringHasTab(const S: atString): boolean;
var
  i: integer;
begin
  Result:= false;
  for i:= 1 to Length(S) do
    if S[i]=#9 then exit(true);
end;

function SStringHasAsciiAndNoTabs(const S: atString): boolean;
var
  code, i: integer;
begin
  Result:= true;
  for i:= 1 to Length(S) do
  begin
    code:= Ord(S[i]);
    if (code<32) or (code>=127) then
      exit(false);
  end;
end;

function SStringHasAsciiAndNoTabs(const S: string): boolean;
var
  code, i: integer;
begin
  Result:= true;
  for i:= 1 to Length(S) do
  begin
    code:= Ord(S[i]);
    if (code<32) or (code>=127) then
      exit(false);
  end;
end;


function SStringHasTab(const S: string): boolean;
var
  i: integer;
begin
  Result:= false;
  for i:= 1 to Length(S) do
    if S[i]=#9 then exit(true);
end;

function SIndentUnindent(const Str: atString; ARight: boolean;
  AIndentSize, ATabSize: integer; ATabSpaces: boolean): atString;
var
  StrIndent, StrText: atString;
  DecSpaces, N: integer;
  DoTabs: boolean;
begin
  Result:= Str;

  if AIndentSize=0 then
  begin
    if ATabSpaces then
      StrIndent:= StringOfChar(' ', ATabSize)
    else
      StrIndent:= #9;
    DecSpaces:= ATabSize;
  end
  else
  if AIndentSize>0 then
  begin
    //use spaces
    StrIndent:= StringOfChar(' ', AIndentSize);
    DecSpaces:= AIndentSize;
  end
  else
  begin
    //indent<0 - use tabs
    StrIndent:= StringOfChar(#9, Abs(AIndentSize));
    DecSpaces:= Abs(AIndentSize)*ATabSize;
  end;

  if ARight then
    Result:= StrIndent+Str
  else
  begin
    N:= SGetIndentChars(Str);
    StrIndent:= Copy(Str, 1, N);
    StrText:= Copy(Str, N+1, MaxInt);
    DoTabs:= Pos(#9, StrIndent)>0;

    StrIndent:= STabsToSpaces(StrIndent, ATabSize);
    if DecSpaces>Length(StrIndent) then
      DecSpaces:= Length(StrIndent);
    Delete(StrIndent, 1, DecSpaces);

    if DoTabs then
      StrIndent:= SSpacesToTabs(StrIndent, ATabSize);
    Result:= StrIndent+StrText;
  end;
end;

function SRemoveAsciiControlChars(const S: atString; AReplaceChar: Widechar
  ): atString;
var
  i: integer;
begin
  Result:= S;
  if OptUnprintedReplaceSpec then
    for i:= 1 to Length(Result) do
      if IsCharAsciiControl(Result[i]) then
        Result[i]:= AReplaceChar;
end;

function SRemoveHexChars(const S: atString): atString;
var
  i: integer;
begin
  Result:= S;
  for i:= 1 to Length(Result) do
    if IsCharHex(Result[i]) then
      Result[i]:= '?';
end;

function SRemoveNewlineChars(const S: atString): atString;
var
  i: integer;
begin
  Result:= S;
  for i:= 1 to Length(Result) do
    if IsCharEol(Result[i]) then
      Result[i]:= ' ';
end;



function STrimRight(const S: atString): atString;
var
  N: integer;
begin
  N:= Length(S);
  while (N>0) and (S[N]=' ') do Dec(N);
  Result:= Copy(S, 1, N);
end;

function SBeginsWith(const S, SubStr: atString): boolean;
begin
  Result:= (SubStr<>'') and (Copy(S, 1, Length(SubStr))=SubStr);
end;

function SBeginsWith(const S, SubStr: string): boolean;
begin
  Result:= (SubStr<>'') and (Copy(S, 1, Length(SubStr))=SubStr);
end;

function SEndsWith(const S, SubStr: atString): boolean;
begin
  Result:= (SubStr<>'') and (Length(SubStr)<=Length(S)) and
    (Copy(S, Length(S)-Length(SubStr)+1, MaxInt)=SubStr);
end;

function SEndsWith(const S, SubStr: string): boolean;
begin
  Result:= (SubStr<>'') and (Length(SubStr)<=Length(S)) and
    (Copy(S, Length(S)-Length(SubStr)+1, MaxInt)=SubStr);
end;

function SEndsWithEol(const S: string): boolean;
begin
  Result:= (S<>'') and IsCharEol(S[Length(S)]);
end;

function SEndsWithEol(const S: atString): boolean;
begin
  Result:= (S<>'') and IsCharEol(S[Length(S)]);
end;


function SCharUpper(ch: atChar): atChar;
begin
  Result:= UnicodeUpperCase(ch)[1];
end;

function SCharLower(ch: atChar): atChar;
begin
  Result:= UnicodeLowerCase(ch)[1];
end;


function SCaseTitle(const S, SWordChars: atString): atString;
var
  i: integer;
begin
  Result:= S;
  for i:= 1 to Length(Result) do
    if (i=1) or not IsCharWord(S[i-1], SWordChars) then
      Result[i]:= SCharUpper(Result[i])
    else
      Result[i]:= SCharLower(Result[i]);
end;

function SCaseInvert(const S: atString): atString;
var
  i: integer;
begin
  Result:= S;
  for i:= 1 to Length(Result) do
    if S[i]<>SCharUpper(S[i]) then
      Result[i]:= SCharUpper(Result[i])
    else
      Result[i]:= SCharLower(Result[i]);
end;

function SCaseSentence(const S, SWordChars: atString): atString;
var
  dot: boolean;
  i: Integer;
begin
  Result:= S;
  dot:= True;
  for i:= 1 to Length(Result) do
  begin
    if IsCharWord(Result[i], SWordChars) then
    begin
      if dot then
        Result[i]:= SCharUpper(Result[i])
      else
        Result[i]:= SCharLower(Result[i]);
      dot:= False;
    end
    else
      if (Result[i] = '.') or (Result[i] = '!') or (Result[i] = '?') then
        dot:= True;
  end;
end;


function SDecodeRecords(const S: UnicodeString; const Decode: array of TATDecodeRec): UnicodeString;
var
  i, j: Integer;
  DoDecode: Boolean;
begin
  Result := '';
  i := 1;
  repeat
    if i > Length(S) then Break;
    DoDecode := False;
    for j := Low(Decode) to High(Decode) do
      with Decode[j] do
        if SFrom = Copy(S, i, Length(SFrom)) then
        begin
          DoDecode := True;
          Result := Result + STo;
          Inc(i, Length(SFrom));
          Break
        end;
    if DoDecode then Continue;
    Result := Result + S[i];
    Inc(i);
  until False;
end;


procedure SReplaceAll(var s: string; const SFrom, STo: string);
begin
  S:= StringReplace(S, SFrom, STo, [rfReplaceAll]);
end;

procedure SReplaceAllPercentChars(var S: string);
var
  i: Integer;
begin
  for i:= $20 to $2F do
    SReplaceAll(S, '%'+IntToHex(i, 2), Chr(i));

  i:= $7C;
  SReplaceAll(S, '%'+IntToHex(i, 2), Chr(i));
end;

procedure SReplaceAllTabsToOneSpace(var S: string);
var
  i: integer;
begin
  for i:= 1 to Length(S) do
    if S[i]=#9 then
      S[i]:= ' ';
end;


procedure SDeleteFrom(var s: string; const SFrom: string);
var
  n: integer;
begin
  n:= Pos(SFrom, S);
  if n>0 then
    Delete(S, n, MaxInt);
end;

procedure SDeleteFrom(var s: atString; const SFrom: atString);
var
  n: integer;
begin
  n:= Pos(SFrom, S);
  if n>0 then
    Delete(S, n, MaxInt);
end;

procedure SDeleteFromEol(var s: string);
begin
  SDeleteFrom(s, #10);
  SDeleteFrom(s, #13);
end;

procedure SDeleteFromEol(var s: atString);
begin
  SDeleteFrom(s, #10);
  SDeleteFrom(s, #13);
end;

procedure SAddStringToHistory(const S: string; List: TStrings; MaxItems: integer);
var
  n: integer;
begin
  if s<>'' then
  begin
    n:= List.IndexOf(s);
    if n>=0 then
      List.Delete(n);
    List.Insert(0, s);
  end;

  while List.Count>MaxItems do
    List.Delete(List.Count-1);
end;

procedure SClipboardCopy(AText: string; AClipboardObj: TClipboard=nil);
begin
  if AText='' then exit;
  if AClipboardObj=nil then
    AClipboardObj:= Clipboard;

  {$IFDEF LCLGTK2}
  //Workaround for Lazarus bug #0021453. LCL adds trailing zero to clipboard in Clipboard.AsText.
  AClipboardObj.Clear;
  AClipboardObj.AddFormat(PredefinedClipboardFormat(pcfText), AText[1], Length(AText));
  {$ELSE}
  AClipboardObj.AsText:= AText;
  {$ENDIF}
end;


//function posted by user "mse" at Laz forum
function SConvertUtf8ToWideForAscii(const S: string): UnicodeString;
var
  PStart, PEnd: PByte;
  PDest: PWord;
  NLen: integer;
begin
  NLen:= Length(S);
  SetLength(Result, NLen);
  PStart:= Pointer(S);
  PEnd:= PStart+NLen;
  PDest:= Pointer(Result);
  while PStart<PEnd do
  begin
    PDest^:= PStart^;
    Inc(PStart);
    Inc(PDest);
  end;
end;


end.

