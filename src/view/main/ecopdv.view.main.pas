unit ecopdv.view.main;

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
  FMX.Effects,
  FMX.Objects,
  FMX.Layouts,
  System.Skia,
  FMX.Ani,
  FMX.Skia,
  FMX.Controls.Presentation,
  FMX.MultiView,
  ecopdv.view.frames.menu;

type
  TFormMain = class(TForm)
    rectContent: TRectangle;
    lytBottom: TLayout;
    imgEcocentauro: TImage;
    ShadowEffect7: TShadowEffect;
    lytTop: TLayout;
    imgEcoPDV: TImage;
    ShadowEffect1: TShadowEffect;
    rectAtalhoMenu: TRectangle;
    ShadowEffect6: TShadowEffect;
    lblAtalhoMenu: TSkLabel;
    rectMenu: TRectangle;
    shadowClose: TShadowEffect;
    lblMenu: TSkLabel;
    lblNomeUsuario: TSkLabel;
    rectAtalhoNotif: TRectangle;
    ShadowEffect2: TShadowEffect;
    lblAtalhoNotif: TSkLabel;
    rectNotif: TRectangle;
    ShadowEffect3: TShadowEffect;
    svgNotif: TSkSvg;
    viewMenu: TMultiView;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure rectAtalhoMenuMouseEnter(Sender: TObject);
    procedure rectAtalhoMenuMouseLeave(Sender: TObject);
    procedure rectAtalhoNotifMouseEnter(Sender: TObject);
    procedure rectAtalhoNotifMouseLeave(Sender: TObject);
    procedure rectAtalhoMenuClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private

  public
    procedure MostrarMenu;

  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}


uses
  ecopdv.helper.Dialogs,
  ecopdv.controllers.usuario,
  ecopdv.view.login,
  ecopdv.view.dialog.abrircaixa;

procedure TFormMain.FormActivate(Sender: TObject);
begin
  OnActivate := nil;

  Self.SetBoundsF(Screen.WorkAreaRect);

  if TFormAbrirCaixa.Abrir then
  begin
    TDialogHelper.Aviso('Caixa aberto com sucesso!')
  end;

  lblNomeUsuario.Text := Format('Olá, eu sou o(a) %s',
    [TControllerUsuario.usuario.Nome])
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := TDialogHelper.Questao('Sair do EcoPDV',
    'Você está prestes a sair do EcoPDV. Tem certeza?')
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  var
  LFrameMenu := TFrameMenu.Create(viewMenu);
  LFrameMenu.Parent := viewMenu;
  LFrameMenu.Align := TAlignLayout.Contents
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  case KeyChar of
    'Z', 'z':
      MostrarMenu;
    '3':
      if (viewMenu.IsShowed) and (TDialogHelper.Questao('Trocar de usuário',
        'Para trocar de usuário, você precisa abandonar o carrinho de compras atual, deseja prosseguir?')
        ) then
        TFormLogin.DoLogin;
  end;
  case Key of
    vkEscape:
      if viewMenu.IsShowed then
        MostrarMenu;
  end;
end;

procedure TFormMain.MostrarMenu;
begin
  viewMenu.NavigationPaneOptions.CollapsedWidth := 0;
  viewMenu.Width := 300;
  if viewMenu.IsShowed then
    viewMenu.HideMaster
  else
    viewMenu.ShowMaster
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  Self.SetBoundsF(Screen.WorkAreaRect);
end;

procedure TFormMain.rectAtalhoMenuClick(Sender: TObject);
begin
  MostrarMenu
end;

procedure TFormMain.rectAtalhoMenuMouseEnter(Sender: TObject);
begin
  rectMenu.Stroke.Thickness := 0;
  rectMenu.Stroke.Color := $FF006CB5;
  rectMenu.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectMenu, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFormMain.rectAtalhoMenuMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectMenu, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFormMain.rectAtalhoNotifMouseEnter(Sender: TObject);
begin
  rectNotif.Stroke.Thickness := 0;
  rectNotif.Stroke.Color := $FF006CB5;
  rectNotif.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectNotif, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFormMain.rectAtalhoNotifMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectNotif, 'Stroke.Thickness', 0, 0.3);
end;

end.
