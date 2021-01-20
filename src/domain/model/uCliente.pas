unit uCliente;

interface

uses
  uEndereco, Generics.Collections, Winapi.Windows;

type
  TCliente = class
  private
    FCPF: String;
    FNome: String;
    FEnderecos: TArrayEnderecos;
  public
    property Nome: String read FNome write FNome;
    property CPF: String read FCPF write FCPF;
    property Enderecos: TArrayEnderecos read FEnderecos write FEnderecos;
    destructor Destroy;
  end;

implementation

uses
  System.SysUtils;


destructor TCliente.Destroy;
var
  i: Integer;
begin
  for i := 0 to Pred(Length(Self.FEnderecos)) do
    if Assigned(Self.FEnderecos[i]) then
      FreeAndNil(Self.FEnderecos[i]);
end;

end.