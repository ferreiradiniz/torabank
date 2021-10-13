program ToraBankProject;

uses
  Vcl.Forms,
  torabank.view.Main in 'view\torabank.view.Main.pas' {frmMain},
  torabank.model.entities.cliente in 'model\entities\torabank.model.entities.cliente.pas',
  torabank.model.entities.contabancaria in 'model\entities\torabank.model.entities.contabancaria.pas',
  torabank.model.entities.operacaobancaria in 'model\entities\torabank.model.entities.operacaobancaria.pas',
  torabank.model.entities.tipocontasbancarias in 'model\entities\torabank.model.entities.tipocontasbancarias.pas',
  LanguageControl in 'utils\LanguageControl.pas',
  uFormat in 'utils\uFormat.pas',
  torabank.dataModule.DM in 'dataModule\torabank.dataModule.DM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
