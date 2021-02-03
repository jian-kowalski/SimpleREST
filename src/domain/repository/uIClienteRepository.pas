unit uIClienteRepository;

interface

uses
  uICliente, System.Generics.Collections;

type
  IClienteRepository = interface
  ['{CC3FE339-F690-47C8-9E61-327F300F334A}']
    function Buscar(AnIdCliente: Integer): ICliente;
    function BuscarTodos: TList<ICliente>;
    function Adicionar(AoICliente: ICliente): ICliente;
    function Alterar(AnIdCliente: Integer; AoICliente: ICliente): ICliente;
    function Remover(AnIdCliente: Integer): IClienteRepository;
  end;

implementation

end.
