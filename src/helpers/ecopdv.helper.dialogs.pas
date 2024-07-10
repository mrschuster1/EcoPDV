unit ecopdv.helper.dialogs;

interface

type
  TDialogHelper = class

  public
    class procedure MensagemAguarde(Titulo: string; Tempo: integer);
    class procedure Aviso(Titulo: string; const Mensagem: string = '');
    class function Questao(Titulo, Mensagem: string): boolean;

  end;

implementation

uses
  ecopdv.view.load,
  view.dialog;

{ TDialogHelper }

class procedure TDialogHelper.Aviso(Titulo: string;
  const Mensagem: string = '');
begin
  TFormDialog.Aviso(Titulo, Mensagem)
end;

class procedure TDialogHelper.MensagemAguarde(Titulo: string; Tempo: integer);
begin
  TFormLoad.ExibirAguarde(Titulo, Tempo)
end;

class function TDialogHelper.Questao(Titulo, Mensagem: string): boolean;
begin
  Result := TFormDialog.Questao(Titulo, Mensagem)
end;

end.
