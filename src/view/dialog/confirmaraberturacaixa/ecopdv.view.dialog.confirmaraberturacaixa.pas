unit ecopdv.view.dialog.confirmaraberturacaixa;

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
  TFormConfirmarAberturaCaixa = class(TFormDialogBase)
    SkLabel1: TSkLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    SkLabel3: TSkLabel;
    SkLabel4: TSkLabel;
    SkLabel5: TSkLabel;
    Layout3: TLayout;
    lblUsuario: TSkLabel;
    lblData: TSkLabel;
    lblHora: TSkLabel;
    procedure FormCreate(Sender: TObject);
  private

  public
    class function ConfirmarAbertura: boolean;

  end;

var
  FormConfirmarAberturaCaixa: TFormConfirmarAberturaCaixa;

implementation

{$R *.fmx}


uses
  ecopdv.controllers.usuario;

{ TFormConfirmarAberturaCaixa }

class function TFormConfirmarAberturaCaixa.ConfirmarAbertura: boolean;
begin
  var
  LFormConfirmarAberturaCaixa := TFormConfirmarAberturaCaixa.Create(nil);
  try
    Result := LFormConfirmarAberturaCaixa.ShowModal = mrOk;
  finally
    LFormConfirmarAberturaCaixa.Free;
  end;
end;

procedure TFormConfirmarAberturaCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  lblUsuario.Text := TControllerUsuario.usuario.Nome;
  lblData.Text := DateToStr(Date);
  lblHora.Text := FormatDateTime('HH:MM', Time)
end;

end.
