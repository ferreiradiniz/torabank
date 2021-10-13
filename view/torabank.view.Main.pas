//Foi adicionado a conexao com o banco de dados
//somente para facilitar a visualizaçao do clientes cadastrados
//em um aplicação normal eu nao colocaria a
//conexao com o banco de na view ela estaria dentro do controller

unit torabank.view.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  torabank.model.entities.operacaobancaria, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    dsContas: TDataSource;
    pnlGrid: TPanel;
    dbgContas: TDBGrid;
    Panel1: TPanel;
    btnLogin: TButton;
    edtNumeroConta: TEdit;
    Label1: TLabel;
    lblCliente: TLabel;
    pnlButtons: TPanel;
    btnDepositar: TSpeedButton;
    btnExtrato: TSpeedButton;
    edtValorDeposito: TEdit;
    Label2: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDepositarClick(Sender: TObject);
    procedure edtValorDepositoKeyPress(Sender: TObject; var Key: Char);
    procedure btnExtratoClick(Sender: TObject);
  private
    FController: TOperacaoBancaria;
    procedure CapturaErro(Sender: TObject; E: Exception);
    procedure ValidarCliente;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses torabank.dataModule.DM, uFormat;

procedure TfrmMain.btnDepositarClick(Sender: TObject);
begin

  ValidarCliente;

  if edtValorDeposito.Text = EmptyStr then
  begin
    MessageDlg('Favor informar o valor de depósito', mtWarning, [mbOK],0);
    Exit;
  end;

  FController.Depositar(edtValorDeposito.Text);
end;

procedure TfrmMain.btnExtratoClick(Sender: TObject);
begin
  ValidarCliente;

  MessageDlg(FController.Extrato, mtInformation, [mbOK], 0);
end;

procedure TfrmMain.btnLoginClick(Sender: TObject);
begin

  if edtNumeroConta.Text = EmptyStr then
  begin
    MessageDlg('Favor informar o Id do cliente', mtInformation, [mbok], 0);
    exit;
  end;

  FController        := TOperacaoBancaria.New; 
  lblCliente.Caption := FController.Login(edtNumeroConta.Text);
end;

procedure TfrmMain.CapturaErro(Sender: TObject; E: Exception);
begin
  MessageDlg(E.Message, mtWarning, [mbOK], 0);
  lblCliente.Caption  := EmptyStr;
  edtNumeroConta.Text := EmptyStr;
  edtValorDeposito.Text := EmptyStr;
  edtNumeroConta.SetFocus;
end;

procedure TfrmMain.edtValorDepositoKeyPress(Sender: TObject; var Key: Char);
begin
  Formatar(Sender, TFormato.Valor);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.OnException := CapturaErro;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  lblCliente.Caption := EmptyStr;
  edtNumeroConta.SetFocus;
end;

procedure TfrmMain.ValidarCliente;
begin
  if lblCliente.Caption = EmptyStr then
   begin
    MessageDlg('Favor selecionar o cliente', mtWarning, [mbOK],0);
    Abort;
  end;
end;

end.
