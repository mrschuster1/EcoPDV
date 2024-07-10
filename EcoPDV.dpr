program EcoPDV;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  ecopdv.view.login in 'src\view\login\ecopdv.view.login.pas' {FormLogin},
  ecopdv.view.load in 'src\view\load\ecopdv.view.load.pas' {FormLoad},
  ecopdv.helper.dialogs in 'src\helpers\ecopdv.helper.dialogs.pas',
  view.dialog in 'src\view\dialog\view.dialog.pas' {FormDialog},
  ecopdv.view.main in 'src\view\main\ecopdv.view.main.pas' {FormMain},
  ecopdv.model.usuario in 'src\model\ecopdv.model.usuario.pas',
  ecopdv.controllers.usuario in 'src\controllers\usuario\ecopdv.controllers.usuario.pas',
  ecopdv.view.frames.menu in 'src\view\frames\menu\ecopdv.view.frames.menu.pas' {FrameMenu: TFrame},
  ecopdv.view.base.dialog in 'src\view\base\dialog\ecopdv.view.base.dialog.pas' {FormDialogBase},
  ecopdv.view.dialog.abrircaixa in 'src\view\dialog\abrircaixa\ecopdv.view.dialog.abrircaixa.pas' {FormAbrirCaixa},
  ecopdv.view.dialog.confirmaraberturacaixa in 'src\view\dialog\confirmaraberturacaixa\ecopdv.view.dialog.confirmaraberturacaixa.pas' {FormConfirmarAberturaCaixa};

{$R *.res}


begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;

end.
