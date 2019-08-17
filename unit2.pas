unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Calendar,
  ExtCtrls, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Calendar1: TCalendar;
    Image1: TImage;
    Image6: TImage;
    Label10: TLabel;
    Panel1: TPanel;
    procedure Image1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;
    MouseIsDown: boolean;
  PX, PY: integer;


implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Image1Click(Sender: TObject);
begin
  form3.Hide;
end;

procedure TForm3.Panel1Click(Sender: TObject);
begin

end;

procedure TForm3.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then begin
    MouseIsDown := True;
    PX := X;
    PY := Y;
  end;
end;

procedure TForm3.Panel1MouseLeave(Sender: TObject);
begin

end;

procedure TForm3.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if MouseIsDown then begin
  SetBounds(Form3.Left + (X - PX), Form3.Top + (Y - PY), Form3.Width, Form3.Height);
end;
end;

procedure TForm3.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     MouseIsDown:=False;
end;

end.

