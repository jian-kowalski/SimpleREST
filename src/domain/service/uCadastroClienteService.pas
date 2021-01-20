unit uCadastroClienteService;

interface

uses
  uCliente, System.Classes, System.Generics.Collections;

type
  TCadastroClienteService = class
  private
  public
    function Buscar(AnId: Integer): TCliente;
    function Listar: TList<TCliente>;
    function Adicionar(AoCliente: TCliente): TCliente;
    function Alterar(AoCliente: TCliente): TCliente;
    procedure Remover(AoCliente: TCliente);
  end;

implementation

function TCadastroClienteService.Adicionar(AoCliente: TCliente): TCliente;
begin
  
end;

function TCadastroClienteService.Alterar(AoCliente: TCliente): TCliente;
begin

end;

function TCadastroClienteService.Buscar(AnId: Integer): TCliente;
begin

end;

function TCadastroClienteService.Listar: TList<TCliente>;
begin

end;

procedure TCadastroClienteService.Remover(AoCliente: TCliente);
begin

end;

end.