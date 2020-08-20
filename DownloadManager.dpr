program DownloadManager;

uses
  Vcl.Forms,
  View.Main in 'View\View.Main.pas' {ViewMain},
  Service.Download in 'Service\Service.Download.pas',
  Service.Interfaces in 'Service\Service.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
