unit ecopdv.view.load;

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
  FMX.Ani,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  System.Skia,
  FMX.Skia,
  FMX.Effects;

type
  TFormLoad = class(TForm)
    rectClient: TRectangle;
    timerClose: TTimer;
    rectContent: TRectangle;
    timerAguarde: TTimer;
    lblAguarde: TSkLabel;
    lblTitle: TSkLabel;
    SkAnimatedImage1: TSkAnimatedImage;
    ShadowEffect1: TShadowEffect;
    procedure timerCloseTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure timerAguardeTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    class procedure ExibirAguarde(Titulo: string; Tempo: integer);

  end;

var
  FormLoad: TFormLoad;

implementation

{$R *.fmx}

{ TFormLoad }

class procedure TFormLoad.ExibirAguarde(Titulo: string; Tempo: integer);
begin
  var
  LFormLoad := TFormLoad.Create(nil);
  try
    LFormLoad.timerClose.Interval := Tempo * 1000;
    LFormLoad.timerClose.Enabled := True;
    LFormLoad.lblTitle.Text := Titulo;
    LFormLoad.ShowModal;
  finally
    FreeAndNil(LFormLoad)
  end;
end;

procedure TFormLoad.FormActivate(Sender: TObject);
begin
  Self.SetBoundsF(Screen.WorkAreaRect)
end;

procedure TFormLoad.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (ssAlt in Shift) and (Key = vkF4) then
    Key := 0
end;

procedure TFormLoad.FormShow(Sender: TObject);
begin
  rectContent.Opacity := 0;
  TAnimator.AnimateFloat(rectContent, 'Opacity', 1, 0.4)
end;

procedure TFormLoad.timerAguardeTimer(Sender: TObject);
begin
  if lblAguarde.Text = 'Aguarde...' then
    lblAguarde.Text := 'Aguarde'
  else
    lblAguarde.Text := lblAguarde.Text + '.'
end;

procedure TFormLoad.timerCloseTimer(Sender: TObject);
begin
  ModalResult := mrOk
end;

end.
