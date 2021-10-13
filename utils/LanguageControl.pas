{ ****************************************************************************

  Criado por Bruno Diniz Fereira
  Data:  11/01/2021

  Unit criada para traduzir o MessageDlg

  Créditos para http://www.delphi.cjcsoft.net/viewthread.php?tid=44194&page=1&styleid=1

  **************************************************************************** }


unit LanguageControl;

interface

implementation

uses
   Windows, Consts;

// Assign new value to a resource string
procedure HookResourceString(ResStringRec: pResStringRec; NewStr: pChar) ;
var
   OldProtect: DWORD;
begin
   VirtualProtect(ResStringRec, SizeOf(ResStringRec^), PAGE_EXECUTE_READWRITE, @OldProtect) ;
   ResStringRec^.Identifier := Integer(NewStr) ;
   VirtualProtect(ResStringRec, SizeOf(ResStringRec^), OldProtect, @OldProtect) ;
end;

initialization
   HookResourceString(@SCannotOpenClipboard, 'Incapaz de abrir a área de transferência') ;
   HookResourceString(@SMsgDlgWarning, '    ATENÇÃO') ;
   HookResourceString(@SMsgDlgError, 'Erro') ;
   HookResourceString(@SMsgDlgInformation, 'Informação') ;
   HookResourceString(@SMsgDlgConfirm, 'Confirme') ;
   HookResourceString(@SMsgDlgYes, '&Sim') ;
   HookResourceString(@SMsgDlgNo, '&Não') ;
   HookResourceString(@SMsgDlgOK, 'OK') ;
   HookResourceString(@SMsgDlgCancel, 'Cancela') ;
   HookResourceString(@SMsgDlgHelp, '&Ajuda') ;
   HookResourceString(@SMsgDlgHelpNone, 'Não possui Ajuda') ;
   HookResourceString(@SMsgDlgHelpHelp, 'Ajuda') ;
   HookResourceString(@SMsgDlgAbort, '&Abortar') ;
   HookResourceString(@SMsgDlgRetry, 'Tentar Novamente') ;
   HookResourceString(@SMsgDlgIgnore, '&Ignorar') ;
   HookResourceString(@SMsgDlgAll, '&Todos') ;
   HookResourceString(@SMsgDlgNoToAll, 'Não para Todos') ;
   HookResourceString(@SMsgDlgYesToAll, 'Sim para Todos') ;
   HookResourceString(@SMsgDlgClose, 'Fechar') ;
end.
