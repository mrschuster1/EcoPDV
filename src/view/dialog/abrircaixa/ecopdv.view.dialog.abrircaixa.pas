unit ecopdv.view.dialog.abrircaixa;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  ecopdv.view.base.dialog,
  System.Skia,
  FMX.Layouts,
  FMX.Effects,
  FMX.Skia,
  FMX.Objects;

type
  TFormAbrirCaixa = class(TFormDialogBase)
    procedure FormCreate(Sender: TObject);
  private

  public
    class function Abrir: boolean;

  end;

var
  FormAbrirCaixa: TFormAbrirCaixa;

implementation

{$R *.fmx}


uses
  ecopdv.controllers.usuario,
  ecopdv.view.dialog.confirmaraberturacaixa;

class function TFormAbrirCaixa.Abrir: boolean;
begin
  var
  LFormAbrirCaixa := TFormAbrirCaixa.Create(nil);
  try
    Result := (LFormAbrirCaixa.ShowModal = mrOk) and
      (TFormConfirmarAberturaCaixa.ConfirmarAbertura);
  finally
    LFormAbrirCaixa.Free;
  end;
end;

procedure TFormAbrirCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitle.Words[2].Text := Format(lblTitle.Words[2].Text,
    [TControllerUsuario.usuario.Nome])
end;

end.
