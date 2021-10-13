unit torabank.dataModule.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    qryConta: TFDMemTable;
    qryContaValorTotal: TCurrencyField;
    qryContaNumeroConta: TIntegerField;
    qryCliente: TFDMemTable;
    qryClienteId: TIntegerField;
    qryClienteTipoCliente: TStringField;
    qryClienteNome: TStringField;
    qryContaIdCliente: TIntegerField;
    qryDepositos: TFDMemTable;
    qryDepositosNumeroConta: TIntegerField;
    qryDepositosValor: TCurrencyField;
    qryDepositosDataDeposito: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CreateClientes;
    procedure CreateContas;
    procedure CreateDepositos;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  System.DateUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDM.CreateClientes;
var
  I          : Integer;
  idCliente  : Integer;
  nomeCliente: String;
  tipoCliente: String;
begin

  idCliente   := 1;
  nomeCliente := 'Orlando Brum';
  tipoCliente := 'PF';

  qryCliente.Open;
  for I := 0 to 3 do
  begin
    qryCliente.Append;
    qryCliente.FieldByName('Id').AsInteger         := idCliente;
    qryCliente.FieldByName('TipoCliente').AsString := tipoCliente;
    qryCliente.FieldByName('Nome').AsString        := nomeCliente;
    qryCliente.Post;

    Inc(idCliente);

    case idCliente of
      2:
        begin
          tipoCliente := 'PJ';
          nomeCliente := 'Armarinho LTDA';
        end;
      3:
        begin
          tipoCliente := 'PF';
          nomeCliente := 'Fernando Sabino';
        end;
      4:
        begin
          tipoCliente := 'PJ';
          nomeCliente := 'DEV Transportes LTDA';
        end;
    end;
  end;

end;

procedure TDM.CreateContas;
var
  I          : Integer;
  idCliente  : Integer;
  nomeCliente: String;
  numConta   : Integer;
  valorTotal : Currency;

begin
  idCliente   := 1;
  qtdExtrato  := 0;
  numConta    := 1010;

  valorTotal := 10.00;

  qryConta.Open;

  for I := 0 to 3 do
  begin
    qryConta.Append;
    qryConta.FieldByName('NumeroConta').AsInteger := numConta;
    qryConta.FieldByName('ValorTotal').AsCurrency := valorTotal;
    qryConta.FieldByName('IdCliente').AsInteger   := idCliente;
    qryConta.Post;

    Inc(idCliente);
    Inc(numConta);
    Inc(qtdDeposito);
    Inc(qtdExtrato);
    valorTotal := valorTotal + 15.00;

  end;
end;

procedure TDM.CreateDepositos;
var
  valor       : Currency;
  dataDeposito: TDateTime;
begin

  valor        := 10.00;
  dataDeposito := Now;

  if not DM.qryDepositos.Active then
    DM.qryDepositos.Open;

  DM.qryConta.First;

  while not DM.qryConta.Eof do
  begin
    DM.qryDepositos.Append;
    DM.qryDepositos.FieldByName('NumeroConta').AsInteger := DM.qryConta.FieldByName('NumeroConta')
      .AsInteger;
    DM.qryDepositos.FieldByName('Valor').AsCurrency        := valor;
    DM.qryDepositos.FieldByName('DataDeposito').AsDateTime := dataDeposito;
    DM.qryDepositos.Post;
    DM.qryConta.Next;
  end;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  CreateClientes;
  CreateContas;
  CreateDepositos;
end;

end.
