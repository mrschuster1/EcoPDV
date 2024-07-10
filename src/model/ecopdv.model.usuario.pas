unit ecopdv.model.usuario;

interface

uses
  SysUtils,
  StrUtils;

type
  TUsuario = class
  private
    FLogin: string;
    FNome: string;
    procedure Initialize;
    function GetNome: string;
    procedure SetNome(const Value: string);

  public
    constructor Create; reintroduce;
    property Login: string read FLogin write FLogin;
    property Nome: string read GetNome write SetNome;

  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin
  inherited Create;
  Initialize
end;

function TUsuario.GetNome: string;
begin
  Result := UpperCase(LeftStr(FNome, 1)) +
    LowerCase(RightStr(FNome, Length(FNome) - 1))
end;

procedure TUsuario.Initialize;
begin
  FLogin := '';
  FNome := '';
end;

procedure TUsuario.SetNome(const Value: string);
begin
  FNome := UpperCase(LeftStr(Value, 1)) +
    LowerCase(RightStr(Value, Length(Value) - 1))
end;

end.
