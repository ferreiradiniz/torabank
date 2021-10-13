unit torabank.model.entities.operacaobancaria;

interface

uses
  torabank.model.entities.cliente,
  torabank.model.entities.contabancaria,
  torabank.model.entities.tipocontasbancarias;

type
  TOperacaoBancaria = class
  private
    FCliente      : ICliente;
    FContaBancaria: IContaBancaria;

    procedure CreateConta;
    function ValorToCurrency(aValor: String): Currency;

    constructor Create;
  public
    class function New: TOperacaoBancaria;

    function Login(aIdCliente: String): String;
    procedure Depositar(aValue: String);
    function Extrato: String;

  end;

var
  controller: TOperacaoBancaria;

implementation

uses
  System.SysUtils, torabank.dataModule.DM, System.RegularExpressions;

{ TOperacaoBancaria }

constructor TOperacaoBancaria.Create;
begin
  inherited;
end;

procedure TOperacaoBancaria.CreateConta;
begin
  if FCliente.TipoPessoa = 'PF' then
    FContaBancaria := TContaBancarioaPF.Create(FCliente)
  else
    FContaBancaria := TContaBancarioaPJ.Create(FCliente);
end;

procedure TOperacaoBancaria.Depositar(aValue: String);
begin
    CreateConta;

   FContaBancaria.Depositar(ValorToCurrency(aValue));

end;

function TOperacaoBancaria.Extrato: String;
begin
  CreateConta;
  Result :=  FContaBancaria.Extrato;
end;

function TOperacaoBancaria.Login(aIdCliente: String): String;
begin
  if DM.qryCliente.Locate('Id', aIdCliente) then
  begin

    FCliente := TCliente.Create;

    FCliente.Id(DM.qryCliente.FieldByName('Id').AsInteger)
      .Nome(DM.qryCliente.FieldByName('Nome').AsString)
      .TipoPessoa(DM.qryCliente.FieldByName('TipoCliente').AsString);

    Result := FCliente.Nome;
  end
  else
    raise Exception.Create('Cliente não encontrado');
end;

class function TOperacaoBancaria.New: TOperacaoBancaria;
begin
  if controller = nil then
    controller := TOperacaoBancaria.Create;

  Result := controller;
end;

function TOperacaoBancaria.ValorToCurrency(aValor: String): Currency;
var
  valorEditado  : String;
  valorInformado: Currency;
begin
  valorInformado := 0;
  valorEditado := TRegEx.Replace(aValor, '\.', '');

  try
    valorInformado := StrToCurr(valorEditado);
  except
    on E: Exception do
      raise Exception.Create('Erro ao converter valor depositado');
  end;

  Result := valorInformado;

end;

initialization

controller := nil;

finalization

if controller <> nil then
  controller.Free;

end.
