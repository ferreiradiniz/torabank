// Os tipos de contas banc�rias foram criadas em um unit diferente
// porque se eu criasse as classes na mesma unit de contabancaria
// o delphi n�o respeitaria a visibidade das vari�veis, ou seja,
// a vari�vel FCliente ficaria vis�vel para as classes filhas

unit torabank.model.entities.tipocontasbancarias;

interface

uses torabank.model.entities.contabancaria, torabank.model.entities.cliente;

type
  TContaBancarioaPF = class(TContaBancaria)
  public
    constructor Create(aCliente: ICliente);
    procedure Depositar(aValor: Currency); override;
  end;

  TContaBancarioaPJ = class(TContaBancaria)
  public
    constructor Create(aCliente: ICliente);
    procedure Depositar(aValor: Currency); override;
  end;

implementation

uses
  System.SysUtils;

{ TContaBancarioaPF }

constructor TContaBancarioaPF.Create(aCliente: ICliente);
begin
  inherited Create(aCliente);
  FQtdMaximoDepositos := 2;
end;

procedure TContaBancarioaPF.Depositar(aValor: Currency);
begin

  if FQtdDepositos >= FQtdMaximoDepositos then
    raise Exception.Create('Voc� excedeu o numero m�ximo de depositos para essa conta')
  else
    inherited;
end;

{ TContaBancarioaPJ }

constructor TContaBancarioaPJ.Create(aCliente: ICliente);
begin
  inherited Create(aCliente);
  FQtdMaximoDepositos := 3;
end;

procedure TContaBancarioaPJ.Depositar(aValor: Currency);
begin
  if FQtdDepositos >= FQtdMaximoDepositos then
    raise Exception.Create('Voc� excedeu o numero m�ximo de depositos para essa conta')
  else
    inherited;

end;

end.
