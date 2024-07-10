unit ecopdv.view.toast;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  Threading,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Ani,
  FMX.Graphics,
  FMX.Dialogs,
  System.Skia,
  FMX.Effects,
  FMX.Skia,
  FMX.Objects;

type
  TFormToast = class(TForm)
    rectContent: TRectangle;
    lblMensagem: TSkLabel;
    lblTitle: TSkLabel;
    SkAnimatedImage1: TSkAnimatedImage;
    ShadowEffect1: TShadowEffect;
    timerFechar: TTimer;
    procedure timerFecharTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    class procedure ShowToast(Owner: TComponent;
      Titulo: string = 'Sucesso!'; Mensagem: string = '';
      Tempo: integer = 5);

  end;

var
  FormToast: TFormToast;

implementation

{$R *.fmx}

{ TFormToast }

procedure TFormToast.FormShow(Sender: TObject);
begin
  Self.Left := Round(Screen.Width - Self.Width - 40);
  Self.Top := Round(Screen.Height - Self.Height - 60)
end;

class procedure TFormToast.ShowToast(Owner: TComponent;
  Titulo: string = 'Sucesso!'; Mensagem: string = '';
  Tempo: integer = 5);
begin
  // TThread.CreateAnonymousThread(
  // procedure
  // begin
  // var
  // LFormToast := TFormToast.Create(nil);
  // try
  // LFormToast.ShowModal;
  // finally
  // LFormToast.Free;
  // end;
  // end).Start;

  TThread.CreateAnonymousThread(
  procedure
  begin TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      var
      LFormToast := TFormToast.Create(Owner);
      try
        LFormToast.lblTitle.Text := Titulo;
        LFormToast.lblMensagem.Text := Mensagem;
        LFormToast.timerFechar.Interval := Tempo * 1000;
        LFormToast.ShowModal;
        (Owner as TControl).SetFocus;
        (Owner as TControl).BringToFront;
        Sleep(Tempo * 1000)
      finally
        DisposeOfAndNil(LFormToast)
      end;
    end)
  end).Start;
end;

procedure TFormToast.timerFecharTimer(Sender: TObject);
begin
  TAnimator.AnimateFloatWait(rectContent, 'Opacity', 0, 1);
// ModalResult := mrOk
end;

end.
