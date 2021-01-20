unit uEndereco;

interface

type
  TEndereco = class
  private
    FBairro: String;
    FCEP: String;
    FNumero: Integer;
    FRua: String;
  public  
    property CEP: String read FCEP write FCEP;
    property Rua: String read FRua write FRua;
    property Bairro: String read FBairro write FBairro;
    property Numero: Integer read FNumero write FNumero;
  end;
  
  TArrayEnderecos = array of TEndereco;

implementation

end.