unit uClienteRepository;

interface

uses
  System.Classes, System.Generics.Collections, uICadastroClienteService, uICliente,
  uIClienteRepository;

type
  TClienteRepository = class(TInterfacedObject, IClienteRepository)
  private
    FoClienteList: TDictionary<Integer, ICliente>;
    function GetProximoId: Integer;
  public
    function Buscar(AnIdCliente: Integer): ICliente;
    function BuscarTodos: TList<ICliente>;
    function Adicionar(AoICliente: ICliente): ICliente;
    function Alterar(AnIdCliente: Integer; AoICliente: ICliente): ICliente;
    function Remover(AnIdCliente: Integer): IClienteRepository;
    class function New: IClienteRepository;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TClienteRepository }

class function TClienteRepository.New: IClienteRepository;
begin
  Result := Create;
end;

constructor TClienteRepository.Create;
begin
  inherited Create;
  FoClienteList := TDictionary<Integer, ICliente>.Create;
end;

function TClienteRepository.Adicionar(AoICliente: ICliente): ICliente;
begin
  AoICliente.SetId(GetProximoId);
  FoClienteList.Add(AoICliente.Id, AoICliente);
  Result := Buscar(AoICliente.Id);
end;

function TClienteRepository.Alterar(AnIdCliente: Integer;
  AoICliente: ICliente): ICliente;
var
  oCliente: ICliente;
begin
  oCliente := Buscar(AnIdCliente);
  FoClienteList.AddOrSetValue(oCliente.Id, oCliente);
end;

function TClienteRepository.Buscar(AnIdCliente: Integer): ICliente;
var
  oCliente: ICliente;
begin
  Result := nil;
  if FoClienteList.TryGetValue(AnIdCliente, oCliente) then
    Result := oCliente;
end;

function TClienteRepository.BuscarTodos: TList<ICliente>;
var
  oClienteList: TList<ICliente>;
  oCliente: ICliente;
begin
  oClienteList := TList<ICliente>.Create;
  for OCliente in FoClienteList.Values do
    oClienteList.Add(oCliente);

  Result := oClienteList;
end;

function TClienteRepository.Remover(AnIdCliente: Integer): IClienteRepository;
begin
  Result := Self;
  FoClienteList.Remove(AnIdCliente);
end;

function TClienteRepository.GetProximoId: Integer;
begin
  Result := FoClienteList.Count +1;
end;

destructor TClienteRepository.Destroy;
begin
  if Assigned(FoClienteList) then
   FreeAndNil(FoClienteList);
  inherited;
end;

end.
