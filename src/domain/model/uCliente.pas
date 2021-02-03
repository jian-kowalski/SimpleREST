unit uCliente;

interface

uses
  Generics.Collections, Winapi.Windows, uICliente;

type
  TCliente = class(TInterfacedObject, ICliente)
  private
    FId: Integer;
    FCPF: String;
    FNome: String;
    function GetCPF: String;
    function GetNome: String;
    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);
    function GetId: Integer;
    procedure SetId(const Value: Integer);
  public
    property Nome: String read GetNome write SetNome;
    property CPF: String read GetCPF write SetCPF;
    property Id: Integer read GetId write SetId;
    class function New: ICliente;
  end;

implementation

uses
  System.SysUtils;


{ TCliente }

class function TCliente.New: ICliente;
begin
  Result := Create;
end;

function TCliente.GetCPF: String;
begin
  Result := FCPF;
end;

function TCliente.GetId: Integer;
begin
  Result := FId;
end;

function TCliente.GetNome: String;
begin
  Result := FCPF;
end;

procedure TCliente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TCliente.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.