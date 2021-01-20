unit uClienteController;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer,
      Datasnap.DSAuth, System.JSON, REST.Json, uICadastroClienteService;

type
{$METHODINFO ON}
  TClienteController = class(TComponent)
  private
    FoCadastroCliente: ICasdastroClienteService;
    { Private declarations }
  public
    { Public declarations }
    function Clientes(AnIdCliente: Integer): TJSONObject;
    function updateClientes(AoJson: TJSONObject): TJSONObject;
    procedure AfterConstruction; override;
  end;
{$METHODINFO OFF}

implementation

uses
  uCadastroClienteService, uICliente, uCliente;

{ TClienteController }

procedure TClienteController.AfterConstruction;
begin
  inherited;
  FoCadastroCliente := TCadastroClienteService.New;
end;

function TClienteController.Clientes(AnIdCliente: Integer): TJSONObject;
var
  oCliente: TCliente;
begin
  oCliente := TCliente(FoCadastroCliente.Buscar(AnIdCliente));
  Result := TJson.ObjectToJsonObject(oCliente);
end;

function TClienteController.updateClientes(AoJson: TJSONObject): TJSONObject;
var
  oCliente: TCliente;
begin
  oCliente := TCliente(FoCadastroCliente.Adicionar(TJson.JsonToObject<TCliente>(AoJson)));
  Result := TJson.ObjectToJsonObject(oCliente);
end;

end.

