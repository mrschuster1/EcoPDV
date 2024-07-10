unit view.dialog;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Ani,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  System.Skia,
  FMX.Skia,
  FMX.Objects,
  FMX.Effects,
  FMX.Layouts;

type
  TFormDialog = class(TForm)
    rectClient: TRectangle;
    rectContent: TRectangle;
    lblMensagem: TSkLabel;
    lblTitle: TSkLabel;
    svgIcone: TSkSvg;
    ShadowEffect1: TShadowEffect;
    lytButtons: TLayout;
    rectAtalhoConfirmar: TRectangle;
    ShadowEffect3: TShadowEffect;
    rectConfirmar: TRectangle;
    ShadowEffect4: TShadowEffect;
    lblConfirmar: TSkLabel;
    lblAtalhoConfirmar: TSkLabel;
    rectAtalhoCancelar: TRectangle;
    ShadowEffect2: TShadowEffect;
    rectCancelar: TRectangle;
    ShadowEffect5: TShadowEffect;
    lblCancelar: TSkLabel;
    lblAtalhoCancelar: TSkLabel;
    rectAtalhoClose: TRectangle;
    ShadowEffect6: TShadowEffect;
    SkLabel2: TSkLabel;
    rectClose: TRectangle;
    shadowClose: TShadowEffect;
    lblClose: TSkLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rectCancelarMouseEnter(Sender: TObject);
    procedure rectCancelarMouseLeave(Sender: TObject);
    procedure rectConfirmarMouseEnter(Sender: TObject);
    procedure rectConfirmarMouseLeave(Sender: TObject);
    procedure rectConfirmarClick(Sender: TObject);
    procedure rectCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure rectAtalhoCloseMouseEnter(Sender: TObject);
    procedure rectAtalhoCloseMouseLeave(Sender: TObject);
    procedure rectAtalhoCloseClick(Sender: TObject);
    procedure rectCloseClick(Sender: TObject);
  private
    procedure Confirmar;
    procedure Cancelar;

  public
    class function Questao(Titulo, Mensagem: string): boolean;
    class procedure Aviso(Titulo, Mensagem: string);

  end;

var
  FormDialog: TFormDialog;

implementation

{$R *.fmx}

{ TFormDialog }

class procedure TFormDialog.Aviso(Titulo, Mensagem: string);
begin
  var
  LFormDialog := TFormDialog.Create(nil);
  try
    LFormDialog.lblTitle.Text := Titulo;
    LFormDialog.lblMensagem.Text := Mensagem;
    LFormDialog.rectAtalhoCancelar.Visible := False;
    LFormDialog.lblConfirmar.Text := 'Ok';
    LFormDialog.rectAtalhoConfirmar.Align := TAlignLayout.HorzCenter;
    LFormDialog.ShowModal;
  finally
    FreeAndNil(LFormDialog)
  end;
end;

procedure TFormDialog.Cancelar;
begin
  ModalResult := mrCancel
end;

procedure TFormDialog.Confirmar;
begin
  ModalResult := mrOk
end;

procedure TFormDialog.FormActivate(Sender: TObject);
begin
  Self.SetBoundsF(Screen.WorkAreaRect)
end;

procedure TFormDialog.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  case KeyChar of
    '1': Confirmar;
    '3': Cancelar;
  end;
  case Key of
    vkReturn: Confirmar;
    vkEscape: Cancelar;
  end;
end;

procedure TFormDialog.FormShow(Sender: TObject);
begin
  rectContent.Opacity := 0;
  TAnimator.AnimateFloat(rectContent, 'Opacity', 1, 0.4)
end;

class function TFormDialog.Questao(Titulo, Mensagem: string): boolean;
begin
  var
  LFormDialog := TFormDialog.Create(nil);
  try
    LFormDialog.lblTitle.Text := Titulo;
    LFormDialog.lblMensagem.Text := Mensagem;
    Result := LFormDialog.ShowModal = mrOk
  finally
    FreeAndNil(LFormDialog)
  end;
end;

procedure TFormDialog.rectAtalhoCloseClick(Sender: TObject);
begin
  Cancelar
end;

procedure TFormDialog.rectAtalhoCloseMouseEnter(Sender: TObject);
begin
  rectClose.Stroke.Thickness := 0;
  rectClose.Stroke.Color := $FFB52100;
  rectClose.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectClose, 'Stroke.Thickness', 2, 0.3);
  lblClose.Words[0].FontColor := $FFB52100;
  lblClose.Words[0].Decorations.StrokeColor := $FFB52100;
end;

procedure TFormDialog.rectAtalhoCloseMouseLeave(Sender: TObject);
begin
  lblClose.Words[0].Decorations.StrokeColor := $FF006CB5;
  lblClose.Words[0].FontColor := $FF006CB5;
  TAnimator.AnimateFloat(rectClose, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFormDialog.rectConfirmarClick(Sender: TObject);
begin
  Confirmar
end;

procedure TFormDialog.rectConfirmarMouseEnter(Sender: TObject);
begin
  rectConfirmar.Stroke.Thickness := 0;
  rectConfirmar.Stroke.Color := $FF006CB5;
  rectConfirmar.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectConfirmar, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFormDialog.rectConfirmarMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectConfirmar, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFormDialog.rectCancelarClick(Sender: TObject);
begin
  Cancelar
end;

procedure TFormDialog.rectCancelarMouseEnter(Sender: TObject);
begin
  rectCancelar.Stroke.Thickness := 0;
  rectCancelar.Stroke.Color := $FFB52100;
  rectCancelar.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectCancelar, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFormDialog.rectCancelarMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectCancelar, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFormDialog.rectCloseClick(Sender: TObject);
begin
  Cancelar
end;

end.
