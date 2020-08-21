program DownloadManager;

uses
  Vcl.Forms,
  View.Main in 'View\View.Main.pas' {ViewMain},
  Service.Download in 'Service\Service.Download.pas',
  Service.Consts in 'Service\Service.Consts.pas',
  DAO.Connection in 'DAO\DAO.Connection.pas' {Connection: TDataModule},
  Service.Database in 'Service\Service.Database.pas',
  View.DownloadHistory in 'View\View.DownloadHistory.pas' {ViewDownloadHistory},
  Helper.Question in 'Helper\Helper.Question.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConnection, Connection);
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
