program SimpleREST;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uPrincipal in 'src\uPrincipal.pas' {Form1},
  uWebModule in 'src\core\uWebModule.pas' {WebModule1: TWebModule},
  uClienteController in 'src\api\uClienteController.pas',
  uCliente in 'src\domain\model\uCliente.pas',
  uCadastroClienteService in 'src\domain\service\uCadastroClienteService.pas',
  uICadastroClienteService in 'src\domain\service\uICadastroClienteService.pas',
  uICliente in 'src\domain\model\uICliente.pas',
  uClienteRepository in 'src\domain\repository\uClienteRepository.pas',
  uIClienteRepository in 'src\domain\repository\uIClienteRepository.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
