unit ecopdv.view.base.dialog;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  System.Skia,
  FMX.Layouts,
  FMX.Effects,
  FMX.Skia,
  FMX.Ani,
  FMX.Objects;

type
  TFormDialogBase = class(TForm)
    rectClient: TRectangle;
    rectContent: TRectangle;
    lblMensagem: TSkLabel;
    lblTitle: TSkLabel;
    svgIcone: TSkSvg;
    rectAtalhoClose: TRectangle;
    ShadowEffect6: TShadowEffect;
    SkLabel2: TSkLabel;
    rectClose: TRectangle;
    shadowClose: TShadowEffect;
    lblClose: TSkLabel;
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
    procedure rectAtalhoConfirmarMouseEnter(Sender: TObject);
    procedure rectAtalhoConfirmarMouseLeave(Sender: TObject);
    procedure rectAtalhoCancelarMouseEnter(Sender: TObject);
    procedure rectAtalhoCancelarMouseLeave(Sender: TObject);
    procedure rectAtalhoCancelarClick(Sender: TObject);
    procedure rectAtalhoCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure rectAtalhoCloseMouseEnter(Sender: TObject);
    procedure rectAtalhoCloseMouseLeave(Sender: TObject);
    procedure rectAtalhoConfirmarClick(Sender: TObject);
  private
    procedure Confirmar;
    procedure Cancelar;

  public

  end;

var
  FormDialogBase: TFormDialogBase;

implementation

{$R *.fmx}


procedure TFormDialogBase.Cancelar;
begin
  ModalResult := mrCancel
end;

procedure TFormDialogBase.Confirmar;
begin
  ModalResult := mrOk
end;

procedure TFormDialogBase.FormActivate(Sender: TObject);
begin
  Self.SetBoundsF(Screen.WorkAreaRect)
end;

procedure TFormDialogBase.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormDialogBase.FormShow(Sender: TObject);
begin
  rectContent.Opacity := 0;
  TAnimator.AnimateFloat(rectContent, 'Opacity', 1, 0.4)
end;

procedure TFormDialogBase.rectAtalhoCancelarClick(Sender: TObject);
begin
  Cancelar
end;

procedure TFormDialogBase.rectAtalhoCancelarMouseEnter(Sender: TObject);
begin
  rectCancelar.Stroke.Thickness := 0;
  rectCancelar.Stroke.Color := $FFB52100;
  rectCancelar.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectCancelar, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFormDialogBase.rectAtalhoCancelarMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectCancelar, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFormDialogBase.rectAtalhoCloseClick(Sender: TObject);
begin
  Cancelar
end;

procedure TFormDialogBase.rectAtalhoCloseMouseEnter(Sender: TObject);
begin
  rectClose.Stroke.Thickness := 0;
  rectClose.Stroke.Color := $FFB52100;
  rectClose.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectClose, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFormDialogBase.rectAtalhoCloseMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectClose, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFormDialogBase.rectAtalhoConfirmarClick(Sender: TObject);
begin
Confirmar
end;

procedure TFormDialogBase.rectAtalhoConfirmarMouseEnter(Sender: TObject);
begin
  rectConfirmar.Stroke.Thickness := 0;
  rectConfirmar.Stroke.Color := $FF006CB5;
  rectConfirmar.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectConfirmar, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFormDialogBase.rectAtalhoConfirmarMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectConfirmar, 'Stroke.Thickness', 0, 0.3);
end;

end.
