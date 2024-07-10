unit ecopdv.controllers.usuario;

interface

uses
  ecopdv.model.usuario;

type
  TControllerUsuario = class

  public
    class var usuario: TUsuario;
    class procedure Create;
    class procedure Free;

  end;

implementation

{ TControllerUsuario }

class procedure TControllerUsuario.Create;
begin
  usuario := TUsuario.Create
end;

class procedure TControllerUsuario.Free;
begin
  usuario.Free
end;

initialization

TControllerUsuario.Create;

finalization

TControllerUsuario.Free

end.
