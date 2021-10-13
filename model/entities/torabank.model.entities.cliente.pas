unit torabank.model.entities.cliente;

interface

type

  ICliente = interface
    ['{0AE333E6-8B7F-42D8-994E-EE165961C1B9}']
    function Id(aValue: Integer): ICliente; overload;
    function Id: Integer; overload;

    function Nome(aValue: String): ICliente; overload;
    function Nome: String; overload;

    function TipoPessoa(aValue: String): ICliente; overload;
    function TipoPessoa: String; overload;
  end;

  TCliente = class(TInterfacedObject, ICliente)
  private
    FId        : Integer;
    FNome      : String;
    FTipoPessoa: String;
  public

    function Id(aValue: Integer): ICliente; overload;
    function Id: Integer; overload;

    function Nome(aValue: String): ICliente; overload;
    function Nome: String; overload;

    function TipoPessoa(aValue: String): ICliente; overload;
    function TipoPessoa: String; overload;
  end;

implementation

uses
  System.SysUtils;

{ TCliente }

function TCliente.Nome: String;
begin
  if FNome = EmptyStr then
    raise Exception.Create('Nome é obrigatório');

  Result := FNome;
end;

function TCliente.Nome(aValue: String): ICliente;
begin
  Result := Self;
  FNome  := Trim(aValue);
end;

function TCliente.Id(aValue: Integer): ICliente;
begin
  Result := Self;
  FId    := aValue;
end;

function TCliente.Id: Integer;
begin
  Result := FId;

end;

function TCliente.TipoPessoa: String;
begin
  if (FTipoPessoa <> 'PJ') and (FTipoPessoa <> 'PF') then
    raise Exception.Create('Tipo pessoa errada');

  Result := FTipoPessoa;
end;

function TCliente.TipoPessoa(aValue: String): ICliente;
begin
  Result      := Self;
  FTipoPessoa := Trim(aValue);
end;

end.
