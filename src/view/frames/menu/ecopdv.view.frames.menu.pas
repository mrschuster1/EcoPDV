unit ecopdv.view.frames.menu;

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
  FMX.Objects,
  System.Skia,
  FMX.Skia,
  FMX.Ani,
  FMX.Effects,
  FMX.Layouts;

type
  TFrameMenu = class(TFrame)
    rectClient: TRectangle;
    lytTop: TLayout;
    imgEcoPDV: TImage;
    ShadowEffect1: TShadowEffect;
    lblNomeUsuario: TSkLabel;
    Layout1: TLayout;
    rectAtalhoFecharMenu: TRectangle;
    ShadowEffect6: TShadowEffect;
    lblAtalhoFecharMenu: TSkLabel;
    rectFecharMenu: TRectangle;
    shadowClose: TShadowEffect;
    lblFecharMenu: TSkLabel;
    rectAtalhoLogoff: TRectangle;
    ShadowEffect2: TShadowEffect;
    lblAtalhoLogoff: TSkLabel;
    rectLogoff: TRectangle;
    ShadowEffect3: TShadowEffect;
    svgLogoff: TSkSvg;
    Layout2: TLayout;
    SkLabel1: TSkLabel;
    SkLabel2: TSkLabel;
    Layout3: TLayout;
    rectAtalhoFeedBack: TRectangle;
    ShadowEffect7: TShadowEffect;
    lblAtalhoFeedBack: TSkLabel;
    rectFeedBack: TRectangle;
    ShadowEffect8: TShadowEffect;
    svgFeedBack: TSkSvg;
    procedure rectAtalhoFecharMenuClick(Sender: TObject);
    procedure rectAtalhoFecharMenuMouseLeave(Sender: TObject);
    procedure rectAtalhoFecharMenuMouseEnter(Sender: TObject);
    procedure rectAtalhoLogoffMouseEnter(Sender: TObject);
    procedure rectAtalhoLogoffMouseLeave(Sender: TObject);
    procedure rectAtalhoLogoffClick(Sender: TObject);
    procedure rectAtalhoFeedBackMouseEnter(Sender: TObject);
    procedure rectAtalhoFeedBackMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}


uses
  ecopdv.view.main,
  ecopdv.view.login;

procedure TFrameMenu.rectAtalhoFecharMenuClick(Sender: TObject);
begin
  FormMain.MostrarMenu
end;

procedure TFrameMenu.rectAtalhoFecharMenuMouseEnter(Sender: TObject);
begin
  rectFecharMenu.Stroke.Thickness := 0;
  rectFecharMenu.Stroke.Color := $FF006CB5;
  rectFecharMenu.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectFecharMenu, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFrameMenu.rectAtalhoFecharMenuMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectFecharMenu, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFrameMenu.rectAtalhoFeedBackMouseEnter(Sender: TObject);
begin
  rectFeedBack.Stroke.Thickness := 0;
  rectFeedBack.Stroke.Color := $FF006CB5;
  rectFeedBack.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectFeedBack, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFrameMenu.rectAtalhoFeedBackMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectFeedBack, 'Stroke.Thickness', 0, 0.3);
end;

procedure TFrameMenu.rectAtalhoLogoffClick(Sender: TObject);
begin
  TFormLogin.DoLogin
end;

procedure TFrameMenu.rectAtalhoLogoffMouseEnter(Sender: TObject);
begin
  rectLogoff.Stroke.Thickness := 0;
  rectLogoff.Stroke.Color := $FF006CB5;
  rectLogoff.Stroke.Kind := TBrushKind.Solid;
  TAnimator.AnimateFloat(rectLogoff, 'Stroke.Thickness', 2, 0.3);
end;

procedure TFrameMenu.rectAtalhoLogoffMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(rectLogoff, 'Stroke.Thickness', 0, 0.3);
end;

end.
