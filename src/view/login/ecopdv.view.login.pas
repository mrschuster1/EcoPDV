unit ecopdv.view.login;

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
  ShellAPI,
  FMX.Objects,
  System.Skia,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Ani,
  FMX.Skia,
  FMX.Effects,
  FMX.Edit;

type
  TRetornoLogin = record
    Usuario: string;
    Sucesso: boolean;
  end;

type
  TFormLogin = class(TForm)
    rectClient: TRectangle;
    rectContent: TRectangle;
    lblFeedBack: TSkLabel;
    imgEcocentauro: TImage;
    imgEcoPDV: TImage;
    imgEco: TImage;
    rectClose: TRectangle;
    shadowClose: TShadowEffect;
    lblClose: TSkLabel;
    rectUsuario: TRectangle;
    ShadowEffect1: TShadowEffect;
    edtUsuario: TEdit;
    lblIconeUsuario: TSkLabel;
    rectSenha: TRectangle;
    ShadowEffect2: TShadowEffect;
    edtSenha: TEdit;
    lblIconeSenha: TSkLabel;
    lblIconeEntrarUsuario: TSkLabel;
    lblIconeEntrarSenha: TSkLabel;
    lblMostrarSenha: TSkLabel;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    ShadowEffect7: TShadowEffect;
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure imgEcocentauroClick(Sender: TObject);
    procedure rectCloseClick(Sender: TObject);
    procedure rectCloseMouseEnter(Sender: TObject);
    procedure rectCloseMouseLeave(Sender: TObject);
    procedure edtUsuarioMouseEnter(Sender: TObject);
    procedure edtUsuarioMouseLeave(Sender: TObject);
    procedure edtUsuarioEnter(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtSenhaMouseEnter(Sender: TObject);
    procedure edtSenhaMouseLeave(Sender: TObject);
    procedure edtUsuarioTyping(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtSenhaTyping(Sender: TObject);
    procedure lblIconeEntrarSenhaMouseEnter(Sender: TObject);
    procedure lblIconeEntrarSenhaMouseLeave(Sender: TObject);
    procedure lblMostrarSenhaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure lblMostrarSenhaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormShow(Sender: TObject);
    procedure lblIconeEntrarSenhaClick(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure lblIconeEntrarUsuarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    FUsuarioLogin: string;
    FSucessoLogin: boolean;
    procedure Entrar;

  public
    class function DoLogin: TRetornoLogin;

  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.fmx}


uses
  ecopdv.helper.Dialogs,
  ecopdv.controllers.Usuario,
  ecopdv.view.main;

class function TFormLogin.DoLogin: TRetornoLogin;
begin
  if Assigned(FormMain) then
    FreeAndNil(FormMain);

  var
  LFormLogin := TFormLogin.Create(nil);
  try
    Result.Sucesso := LFormLogin.ShowModal = mrOk;
    Result.Usuario := LFormLogin.FUsuarioLogin;
  finally
    FreeAndNil(LFormLogin)
  end;
end;

procedure TFormLogin.edtSenhaEnter(Sender: TObject);
begin
  TAnimator.AnimateColor(edtSenha, 'TextSettings.FontColor',
    TAlphaColorRec.White, 0.3);
  TAnimator.AnimateColor(lblIconeSenha, 'TextSettings.FontColor',
    TAlphaColorRec.White, 0.3);
  TAnimator.AnimateColor(rectSenha, 'Fill.Color', $FF006CB5, 0.1);
end;

procedure TFormLogin.edtSenhaExit(Sender: TObject);
begin
  TAnimator.AnimateColor(edtSenha, 'TextSettings.FontColor',
    TAlphaColorRec.Black, 0.3);
  TAnimator.AnimateColor(lblIconeSenha, 'TextSettings.FontColor',
    TAlphaColorRec.Black, 0.3);
  TAnimator.AnimateColor(rectSenha, 'Fill.Color', TAlphaColorRec.White, 0.1);
end;

procedure TFormLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
    Entrar;
  if (Key = vkTab) and (ssShift in Shift) then
    edtUsuario.SetFocus
end;

procedure TFormLogin.edtSenhaMouseEnter(Sender: TObject);
begin
  rectSenha.Stroke.Thickness := 0;
  rectSenha.Stroke.Color := $FF006CB5;
  rectSenha.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectSenha, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFormLogin.edtSenhaMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectSenha, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFormLogin.edtSenhaTyping(Sender: TObject);
begin
  lblIconeEntrarSenha.Visible := not edtSenha.Text.IsEmpty;
  lblMostrarSenha.Visible := not edtSenha.Text.IsEmpty;
end;

procedure TFormLogin.edtUsuarioEnter(Sender: TObject);
begin
  TAnimator.AnimateColor(edtUsuario, 'TextSettings.FontColor',
    TAlphaColorRec.White, 0.3);
  TAnimator.AnimateColor(lblIconeUsuario, 'TextSettings.FontColor',
    TAlphaColorRec.White, 0.3);
  TAnimator.AnimateColor(rectUsuario, 'Fill.Color', $FF006CB5, 0.1);
end;

procedure TFormLogin.edtUsuarioExit(Sender: TObject);
begin
  TAnimator.AnimateColor(edtUsuario, 'TextSettings.FontColor',
    TAlphaColorRec.Black, 0.3);
  TAnimator.AnimateColor(lblIconeUsuario, 'TextSettings.FontColor',
    TAlphaColorRec.Black, 0.3);
  TAnimator.AnimateColor(rectUsuario, 'Fill.Color', TAlphaColorRec.White, 0.1);
end;

procedure TFormLogin.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key in [vkReturn, vkTab] then
    edtSenha.SetFocus;
end;

procedure TFormLogin.edtUsuarioMouseEnter(Sender: TObject);
begin
  rectUsuario.Stroke.Thickness := 0;
  rectUsuario.Stroke.Color := $FF006CB5;
  rectUsuario.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectUsuario, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFormLogin.edtUsuarioMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectUsuario, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFormLogin.edtUsuarioTyping(Sender: TObject);
begin
  lblIconeEntrarUsuario.Visible := not edtUsuario.Text.IsEmpty
end;

procedure TFormLogin.FormActivate(Sender: TObject);
begin
  Self.SetBoundsF(Screen.WorkAreaRect);
end;

procedure TFormLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not FSucessoLogin then
    Application.Terminate
end;

procedure TFormLogin.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if not FSucessoLogin then
    CanClose := TDialogHelper.Questao('Sair do EcoPDV',
      'Você está prestes a sair do EcoPDV. Tem certeza?')
  else
    CanClose := True
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  FSucessoLogin := False;
end;

procedure TFormLogin.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkEscape then
    Close
end;

procedure TFormLogin.FormResize(Sender: TObject);
begin
  rectClient.Padding.Left := Screen.Width / 3.5;
  rectClient.Padding.Right := Screen.Width / 3.5;
  rectClient.Padding.Top := Screen.Height / 10;
  rectClient.Padding.Bottom := Screen.Height / 10;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
  rectContent.Opacity := 0;
  TAnimator.AnimateFloat(rectContent, 'Opacity', 1, 0.4);
  edtUsuario.SetFocus;
  Self.SetBoundsF(Screen.WorkAreaRect);
end;

procedure TFormLogin.imgEcocentauroClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('https://ecocentauro.com.br/'), '', '', 0);
end;

procedure TFormLogin.lblIconeEntrarSenhaClick(Sender: TObject);
begin
  Entrar
end;

procedure TFormLogin.Entrar;
begin
  if not(string.IsNullOrWhiteSpace(edtUsuario.Text)) and
    not(string.IsNullOrWhiteSpace(edtSenha.Text)) then
  begin
    FSucessoLogin := True;
    TControllerUsuario.Usuario.Nome := edtUsuario.Text;
    FUsuarioLogin := edtUsuario.Text;
    TDialogHelper.MensagemAguarde('Entrando no sistema', 1);

    Application.CreateForm(TFormMain, FormMain);
    Application.MainForm := FormMain;
    FormMain.Show;
    Close;
  end
  else
    if string.IsNullOrWhiteSpace(edtUsuario.Text) then
  begin
    TDialogHelper.Aviso('Aviso', 'Informe o usuário');
    edtUsuario.SetFocus
  end
  else
    if string.IsNullOrWhiteSpace(edtSenha.Text) then
  begin
    TDialogHelper.Aviso('Aviso', 'Informe sua senha');
    edtSenha.SetFocus
  end;
end;

procedure TFormLogin.lblIconeEntrarSenhaMouseEnter(Sender: TObject);
begin
  TAnimator.AnimateFloat(Sender as TFmxObject, 'Opacity', 0.5, 0.1);
end;

procedure TFormLogin.lblIconeEntrarSenhaMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(Sender as TFmxObject, 'Opacity', 1, 0.1);
end;

procedure TFormLogin.lblIconeEntrarUsuarioClick(Sender: TObject);
begin
  edtSenha.SetFocus
end;

procedure TFormLogin.lblMostrarSenhaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  edtSenha.Password := False;
end;

procedure TFormLogin.lblMostrarSenhaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  edtSenha.Password := True;
end;

procedure TFormLogin.rectCloseClick(Sender: TObject);
begin
  Close
end;

procedure TFormLogin.rectCloseMouseEnter(Sender: TObject);
begin
  rectClose.Stroke.Thickness := 0;
  rectClose.Stroke.Color := $FFB52100;
  rectClose.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectClose, 'Stroke.Thickness', 2, 0.3);
  lblClose.Words[0].FontColor := $FFB52100;
  lblClose.Words[0].Decorations.StrokeColor := $FFB52100;
end;

procedure TFormLogin.rectCloseMouseLeave(Sender: TObject);
begin
  lblClose.Words[0].Decorations.StrokeColor := $FF006CB5;
  lblClose.Words[0].FontColor := $FF006CB5;
  TAnimator.AnimateFloat(rectClose, 'Stroke.Thickness', 0, 0.3);
end;

end.
