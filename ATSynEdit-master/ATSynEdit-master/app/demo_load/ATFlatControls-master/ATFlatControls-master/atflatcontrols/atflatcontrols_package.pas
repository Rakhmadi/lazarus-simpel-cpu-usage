{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit atflatcontrols_package;

interface

uses
  ATButtons, atflatcontrols_register, ATListbox, ATLinkLabel, ATFlatToolbar, 
  ATPanelSimple, ATPanelColor, ATScrollBar, ATStatusBar, ATGauge, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('atflatcontrols_register', @atflatcontrols_register.Register);
end;

initialization
  RegisterPackage('atflatcontrols_package', @Register);
end.
