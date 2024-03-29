program BIOSLanguageInfo;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, uSMBIOS
  { you can add units after this };

function ByteToBinStr(AValue:Byte):string;
const
  Bits : array[1..8] of byte = (128,64,32,16,8,4,2,1);
  var i: integer;
begin
  Result:='00000000';
  if (AValue<>0) then
  for i:=1 to 8 do
    if (AValue and Bits[i])<>0 then Result[i]:='1';
end;

procedure GetBIOSLanguageInfo;
Var
  SMBios : TSMBios;
  LBIOSLng  : TBIOSLanguageInformation;
  i: integer;
begin
  SMBios:=TSMBios.Create;
  try
      WriteLn('BIOS Language Information');
      if SMBios.HasBIOSLanguageInfo then
      for LBIOSLng in SMBios.BIOSLanguageInfo do
      begin
        WriteLn('Installable Languages  '+IntToStr( LBIOSLng.RAWBIOSLanguageInformation^.InstallableLanguages));
        WriteLn('Flags                  '+ByteToBinStr(LBIOSLng.RAWBIOSLanguageInformation^.Flags));
        WriteLn('Current Language       '+LBIOSLng.GetCurrentLanguageStr);

        if LBIOSLng.RAWBIOSLanguageInformation^.InstallableLanguages>1 then
        begin
          WriteLn('BIOS Languages');
          WriteLn('--------------');
          for i:=1 to LBIOSLng.RAWBIOSLanguageInformation^.InstallableLanguages do
            WriteLn('  '+LBIOSLng.GetLanguageString(i));
        end;

        WriteLn;
      end
      else
      Writeln('No BIOS Language Info was found');
  finally
   SMBios.Free;
  end;
end;


begin
 try
    GetBIOSLanguageInfo;
 except
    on E:Exception do
        Writeln(E.Classname, ':', E.Message);
 end;
 Writeln('Press Enter to exit');
 Readln;
end.
