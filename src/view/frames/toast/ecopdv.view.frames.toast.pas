unit ecopdv.view.frames.toast;

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
  System.Skia,
  FMX.Effects,
  FMX.Skia,
  FMX.Objects;

type
  TFrameToast = class(TFrame)
    rectContent: TRectangle;
    lblMensagem: TSkLabel;
    lblTitle: TSkLabel;
    SkAnimatedImage1: TSkAnimatedImage;
    ShadowEffect1: TShadowEffect;
    procedure rectContentClick(Sender: TObject);
  private
    FOnClose: TProc;

  public
    property OnClose: TProc read FOnClose write FOnClose;

  end;

implementation

{$R *.fmx}


procedure TFrameToast.rectContentClick(Sender: TObject);
begin
  Self.Visible := False;

  if Assigned(FOnClose) then
    FOnClose;
end;

end.
