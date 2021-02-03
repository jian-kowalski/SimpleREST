unit uCadastroClienteService;

interface

uses
  uCliente, System.Classes, System.Generics.Collections, uICadastroClienteService, uICliente,
  uIClienteRepository;

type
  TCadastroClienteService = class(TInterfacedObject, ICasdastroClienteService)
  private
    FoClienteRepository: IClienteRepository;
  public
    function Buscar(AnId: Integer): ICliente;
    function Listar: TList<ICliente>;
    function Adicionar(AoCliente: ICliente): ICliente;
    function Alterar(AoCliente: ICliente): ICliente;
    procedure Remover(AnId: Integer);
    constructor Create;
    class function New: ICasdastroClienteService;
  end;


var
  CadastroCliente: ICasdastroClienteService;

implementation

uses
  uClienteRepository;

constructor TCadastroClienteService.Create;
begin
  inherited Create;
  FoClienteRepository := TClienteRepository.New;
end;

function TCadastroClienteService.Adicionar(AoCliente: ICliente): ICliente;
begin
  Result := FoClienteRepository.Adicionar(AoCliente);
end;

function TCadastroClienteService.Alterar(AoCliente: ICliente): ICliente;
begin
  Result := FoClienteRepository.Alterar(AoCliente.Id, AoCliente);
end;

function TCadastroClienteService.Buscar(AnId: Integer): ICliente;
begin
  Result := FoClienteRepository.Buscar(AnId);
end;

function TCadastroClienteService.Listar: TList<ICliente>;
begin
  Result := FoClienteRepository.BuscarTodos;
end;

procedure TCadastroClienteService.Remover(AnId: Integer);
begin
  FoClienteRepository.Remover(AnId);
end;

class function TCadastroClienteService.New: ICasdastroClienteService;
begin
  Result := Create;
end;

initialization
  CadastroCliente := TCadastroClienteService.New;



end.