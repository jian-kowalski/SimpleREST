unit uClienteController;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer,
      Datasnap.DSAuth, System.JSON, REST.Json, System.JSON.Readers,
      uICadastroClienteService, uICliente;

type
{$METHODINFO ON}
  TClienteController = class(TComponent)
  private
    FoCadastroCliente: ICasdastroClienteService;
    { Private declarations }
    function RetornarJsonCliente(AoJson: TJSONObject): ICliente;
    function RetornarClienteJson(AoICliente: ICliente): TJSONObject;
  public
    { Public declarations }
    function Clientes(AnIdCliente: Integer): TJSONObject;  //Get
    function updateClientes(AoJson: TJSONObject): TJSONObject; //POST
    function acceptCliente(AoJson: TJSONObject): TJSONObject; //PUT
    procedure cancelClientes(AnIdCliente: Integer); //DELETE

    procedure AfterConstruction; override;
  end;
{$METHODINFO OFF}

implementation

uses
  uCadastroClienteService, uCliente, uWebModule;

{ TClienteController }

function TClienteController.acceptCliente(AoJson: TJSONObject): TJSONObject;
begin
  Result := RetornarClienteJson(FoCadastroCliente.Alterar(RetornarJsonCliente(AoJson)));
end;

procedure TClienteController.AfterConstruction;
begin
  inherited;
  FoCadastroCliente := uCadastroClienteService.CadastroCliente;
end;

procedure TClienteController.cancelClientes(AnIdCliente: Integer);
begin
  FoCadastroCliente.Remover(AnIdCliente);
end;

function TClienteController.Clientes(AnIdCliente: Integer): TJSONObject;
var
  oCliente: ICliente;
begin
  oCliente := FoCadastroCliente.Buscar(AnIdCliente);
  Result := RetornarClienteJson(oCliente);
end;

function TClienteController.updateClientes(AoJson: TJSONObject): TJSONObject;
var
  oCliente: ICliente;
begin
  oCliente := FoCadastroCliente.Adicionar(RetornarJsonCliente(AoJson));
  Result := RetornarClienteJson(oCliente);
end;

function TClienteController.RetornarClienteJson(AoICliente: ICliente): TJSONObject;
begin
  if Assigned(AoICliente) then
    Result := TJson.ObjectToJsonObject(TCliente(AoICliente))
  else
   Result := TJSONObject.Create;
end;

function TClienteController.RetornarJsonCliente(AoJson: TJSONObject): ICliente;
begin
  Result := TJson.JsonToObject<TCliente>(AoJson);
end;


end.

