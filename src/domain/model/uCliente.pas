unit uCliente;

interface

uses
  Generics.Collections, Winapi.Windows, uICliente;

type
  TCliente = class(TInterfacedObject, ICliente)
  private
    FCPF: String;
    FNome: String;
    function GetCPF: String;
    function GetNome: String;
    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);
//    FEnderecos: TArrayEnderecos;
  public
    property Nome: String read GetNome write SetNome;
    property CPF: String read GetCPF write SetCPF;
//    property Enderecos: TArrayEnderecos read FEnderecos write FEnderecos;
//    destructor Destroy;
  end;

implementation

uses
  System.SysUtils;


//destructor TCliente.Destroy;
//var
//  i: Integer;
//begin
//  for i := 0 to Pred(Length(Self.FEnderecos)) do
//    if Assigned(Self.FEnderecos[i]) then
//      FreeAndNil(Self.FEnderecos[i]);
//end;

{ TCliente }

function TCliente.GetCPF: String;
begin
  Result := FCPF;
end;

function TCliente.GetNome: String;
begin
  Result := FCPF;
end;

procedure TCliente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.