object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 279
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 329
    Top = 0
    Width = 362
    Height = 279
    Align = alClient
    Caption = 'pnlGrid'
    TabOrder = 0
    object dbgContas: TDBGrid
      Left = 1
      Top = 1
      Width = 360
      Height = 277
      Align = alClient
      DataSource = dsContas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 279
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 46
      Width = 61
      Height = 13
      Caption = 'Id do Cliente'
    end
    object lblCliente: TLabel
      Left = 9
      Top = 16
      Width = 56
      Height = 14
      Caption = 'lblCliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 135
      Width = 69
      Height = 13
      Caption = 'Valor Deposito'
    end
    object btnLogin: TButton
      Left = 176
      Top = 63
      Width = 75
      Height = 25
      Caption = 'Login'
      TabOrder = 0
      OnClick = btnLoginClick
    end
    object edtNumeroConta: TEdit
      Left = 9
      Top = 65
      Width = 161
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object pnlButtons: TPanel
      Left = -5
      Top = 192
      Width = 329
      Height = 87
      TabOrder = 2
      object btnDepositar: TSpeedButton
        Left = 1
        Top = 1
        Width = 89
        Height = 85
        Align = alLeft
        Caption = 'Depositar'
        OnClick = btnDepositarClick
        ExplicitLeft = 5
      end
      object btnExtrato: TSpeedButton
        Left = 226
        Top = 1
        Width = 102
        Height = 85
        Align = alRight
        Caption = 'Extrato'
        OnClick = btnExtratoClick
        ExplicitTop = 65
        ExplicitHeight = 76
      end
    end
    object edtValorDeposito: TEdit
      Left = 9
      Top = 154
      Width = 161
      Height = 21
      NumbersOnly = True
      TabOrder = 3
      OnKeyPress = edtValorDepositoKeyPress
    end
  end
  object dsContas: TDataSource
    DataSet = DM.qryCliente
    Left = 464
    Top = 80
  end
end
