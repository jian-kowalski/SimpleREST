unit uCadastroClienteService;

interface

uses
  uCliente, System.Classes, System.Generics.Collections, uICadastroClienteService, uICliente;

type
  TCadastroClienteService = class(TInterfacedObject, ICasdastroClienteService)
  private
  public
    function Buscar(AnId: Integer): ICliente;
    function Listar: TList<ICliente>;
    function Adicionar(AoCliente: ICliente): ICliente;
    function Alterar(AoCliente: ICliente): ICliente;
    procedure Remover(AoCliente: ICliente);
    class function New: ICasdastroClienteService;
  end;

implementation

function TCadastroClienteService.Adicionar(AoCliente: ICliente): ICliente;
begin
  Result := AoCliente;
end;

function TCadastroClienteService.Alterar(AoCliente: ICliente): ICliente;
begin

end;

function TCadastroClienteService.Buscar(AnId: Integer): ICliente;
begin

end;

function TCadastroClienteService.Listar: TList<ICliente>;
begin

end;

procedure TCadastroClienteService.Remover(AoCliente: ICliente);
begin

end;

class function TCadastroClienteService.New: ICasdastroClienteService;
begin
  Result := Create;
end;

end.