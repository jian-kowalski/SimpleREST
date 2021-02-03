unit uICadastroClienteService;

interface

uses
  System.Generics.Collections, uICliente;

type
  ICasdastroClienteService = interface
  ['{16C3C01A-87CD-457B-BBB7-9A3DD814C63D}']
    function Buscar(AnId: Integer): ICliente;
    function Listar: TList<ICliente>;
    function Adicionar(AoCliente: ICliente): ICliente;
    function Alterar(AoCliente: ICliente): ICliente;
    procedure Remover(AnId: Integer);
  end;

implementation

end.