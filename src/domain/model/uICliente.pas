unit uICliente;

interface

type
  ICliente = interface
  ['{3F5B861D-CCCD-4FD0-9B26-C94D3AEF386E}']
    function GetCPF: String;
    function GetNome: String;
    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);
    property Nome: String read GetNome write SetNome;
    property CPF: String read GetCPF write SetCPF;
  end;

implementation

end.