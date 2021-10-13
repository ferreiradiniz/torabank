unit torabank.model.entities.contabancaria;

interface

uses torabank.model.entities.cliente;

type
  IContaBancaria = interface
    ['{96DDF553-2BA0-4294-9338-A2EC24A60FD3}']
    procedure Depositar(aValor: Currency);
    function Extrato: String;
  end;

  TContaBancaria = class(TInterfacedObject, IContaBancaria)
  private
    FCliente: ICliente;
    procedure GetDadosConta;
  protected
    FNumeroConta       : Integer;
    FValorTotal        : Currency;
    FQtdExtratos       : Integer;
    FQtdDepositos      : Integer;
    FQtdMaximoExtratos : Integer;
    FQtdMaximoDepositos: Integer;
  public
    constructor Create(aCliente: ICliente);
    destructor Destroy;
    procedure Depositar(aValor: Currency); virtual;
    function Extrato: String;
  end;

implementation

uses
  System.SysUtils,
  torabank.dataModule.DM;

{ TContaBancaria }

constructor TContaBancaria.Create(aCliente: ICliente);
begin
  FCliente := aCliente;
  GetDadosConta;
end;

procedure TContaBancaria.Depositar(aValor: Currency);
begin

  if not DM.qryDepositos.Active then
    DM.qryDepositos.Open;

  DM.qryDepositos.Last;

  DM.qryDepositos.Append;
  DM.qryDepositos.FieldByName('NumeroConta').AsInteger   := FNumeroConta;
  DM.qryDepositos.FieldByName('Valor').AsCurrency        := aValor;
  DM.qryDepositos.FieldByName('DataDeposito').AsDateTime := Now;
  DM.qryDepositos.Post;

end;

destructor TContaBancaria.Destroy;
var
  teste: String;
begin
  teste := 'destruiu';

end;

function TContaBancaria.Extrato: String;
var
  extrato: String;
begin

  extrato := EmptyStr;

  if not DM.qryDepositos.Active then
  begin
    DM.qryDepositos.Open;
  end;

  DM.qryDepositos.Filtered := False;
  DM.qryDepositos.Filter := 'NumeroConta = ' + IntToStr(FNumeroConta);
  DM.qryDepositos.Filtered := True;

  DM.qryDepositos.First;

  while not DM.qryDepositos.Eof do
  begin
    if DM.qryDepositos.RecNo = 1 then
    begin
      extrato := 'EXTRATO CONTA ' + IntToStr(Self.FNumeroConta) + sLineBreak + sLineBreak +
        FCliente.Nome.ToUpper + sLineBreak + FormatCurr('R$ ###,###,###0.00',
        DM.qryDepositos.FieldByName('Valor').AsCurrency) + '   ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',
        DM.qryDepositos.FieldByName('DataDeposito').AsDateTime);
    end
    else
    begin
      extrato := extrato + sLineBreak +   FormatCurr('R$ ###,###,###0.000', DM.qryDepositos.FieldByName('Valor')
        .AsCurrency) + '   ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',
        DM.qryDepositos.FieldByName('DataDeposito').AsDateTime);
    end;

    DM.qryDepositos.Next;
  end;

  Inc(FQtdExtratos);

  Result := extrato;
end;

procedure TContaBancaria.GetDadosConta;
begin
  DM.qryConta.Locate('IdCliente', FCliente.Id);
  FNumeroConta  := DM.qryConta.FieldByName('NumeroConta').AsInteger;
  FValorTotal   := DM.qryConta.FieldByName('ValorTotal').AsCurrency;

  if not DM.qryDepositos.Active then
  begin
    DM.qryDepositos.Open;
  end;

  DM.qryDepositos.Filtered := False;
  DM.qryDepositos.Filter := 'NumeroConta = ' + IntToStr(FNumeroConta);
  DM.qryDepositos.Filtered := True;

  FQtdDepositos := DM.qryDepositos.RecordCount;

end;

end.
