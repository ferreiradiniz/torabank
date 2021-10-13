object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 184
  Width = 357
  object qryConta: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 40
    object qryContaIdCliente: TIntegerField
      FieldName = 'IdCliente'
    end
    object qryContaNumeroConta: TIntegerField
      FieldName = 'NumeroConta'
    end
    object qryContaValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
    end
  end
  object qryCliente: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 24
    object qryClienteId: TIntegerField
      FieldName = 'Id'
    end
    object qryClienteNome: TStringField
      FieldName = 'Nome'
    end
    object qryClienteTipoCliente: TStringField
      FieldName = 'TipoCliente'
    end
  end
  object qryDepositos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 184
    Top = 96
    object qryDepositosNumeroConta: TIntegerField
      FieldName = 'NumeroConta'
    end
    object qryDepositosDataDeposito: TDateField
      FieldName = 'DataDeposito'
    end
    object qryDepositosValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
end
