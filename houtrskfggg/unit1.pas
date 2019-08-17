unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, jwapsapi, jwawinbase, jwawinnt;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);

 var
  psmemCounters: _PROCESS_MEMORY_COUNTERS;
  ThisApp: LongWord;
begin
  ThisApp := GetCurrentProcessID();
  ThisApp := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, FALSE, ThisApp );
  if( ThisApp = LongWord(0)) then
    begin
    Application.Messagebox('OpenProcess Error', 'Error', 0);
    exit;
    end;
  if(GetProcessMemoryInfo(ThisApp, psmemCounters, sizeof(_PROCESS_MEMORY_COUNTERS)) <> LongBool(0)) then
    begin
    Memo1.Clear;
    Memo1.lines.add('WorkingSetSize ' + IntToStr(psmemCounters.WorkingSetSize));
    Memo1.lines.add('');
    Memo1.lines.add('PageFileUsage ' + IntToStr(psmemCounters.PagefileUsage));
    Memo1.lines.add('QuotaNonPagedPoolUsage ' + IntToStr(psmemCounters.QuotaNonPagedPoolUsage));
    Memo1.lines.add('QuotaPagedPoolUsage ' + IntToStr(psmemCounters.QuotaPagedPoolUsage));
    Memo1.lines.add('PageFaultCount ' + IntToStr(psmemCounters.PageFaultCount));
    Memo1.lines.add('');
    Memo1.lines.add('PeakWorkingSetSize ' + IntToStr(psmemCounters.PeakWorkingSetSize));
    Memo1.lines.add('PeakPageFileUsage ' + IntToStr(psmemCounters.PeakPagefileUsage));
    Memo1.lines.add('QuotaPeakNonPagedPoolUsage ' + IntToStr(psmemCounters.QuotaPeakNonPagedPoolUsage));
    Memo1.lines.add('QuotaPeakPagedPoolUsage ' + IntToStr(psmemCounters.QuotaPeakPagedPoolUsage));
    end
  else
    begin
    Application.Messagebox('GetProcessMemoryInfo Error', 'Error', 0);
    end;
  CloseHandle(ThisApp);
end;

initialization
  {$I unit1.lrs}

end.
