unit View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,
  Data.DB,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  FileCtrl,
  Vcl.WinXPanels,
  Service.Download,
  Vcl.Samples.Gauges,
  Service.Database;

type
  TViewMain = class(TForm)
    {$REGION 'Componentes'}
    Panel1: TPanel;
    pnlTitulo: TPanel;
    lnInformacao: TLabel;
    imgNotificacao: TImage;
    pnInformacoes: TPanel;
    Label3: TLabel;
    edtUrlDonwload: TEdit;
    Label1: TLabel;
    sbLocalDonwload: TSearchBox;
    pnCancelDonwload: TPanel;
    pnStartDonwload: TPanel;
    pnShowProgressDownload: TPanel;
    pnGgDownload: TPanel;
    ggDownload: TGauge;
    pnViewDownloadHistory: TPanel;
    procedure sbLocalDonwloadInvokeSearch(Sender: TObject);
    procedure pnStartDonwloadClick(Sender: TObject);
    procedure pnCancelDonwloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnShowProgressDownloadClick(Sender: TObject);
    procedure pnViewDownloadHistoryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    {$ENDREGION}
  private
    FServiceDownload: TServiceDownload;
    FBeginDownload: TDateTime;
    procedure OnProgressTransferStart(ProgressCurrent: Integer);
    procedure OnProgressTransferEnd(Sender: TObject);
    procedure StartDownloadUpdateControls;
    procedure FinishDownloadUpdateControls;
    procedure SaveDownloadDatabase;
    procedure CheckParameters;
    function DownloadInProgress: boolean;
  public
  end;

var
  ViewMain: TViewMain;

resourcestring
  StrEnterDownloadURL = 'Informe uma url válida.';
  StrTellLocationSaveFile = 'Informe um diretório valido.';

implementation

{$R *.dfm}

uses
  Service.Consts,
  View.DownloadHistory,
  Helper.Question;

procedure TViewMain.sbLocalDonwloadInvokeSearch(Sender: TObject);
resourcestring
  StrWhereSaveFile = 'Onde deseja salvar o arquivo?';
var
  Directory: string;
begin
  if not SelectDirectory(StrWhereSaveFile, '', Directory, [sdNewUI, sdValidateDir, sdNewFolder]) then
    Exit;

  sbLocalDonwload.Text := Directory;
end;

procedure TViewMain.pnShowProgressDownloadClick(Sender: TObject);
begin
  ggDownload.ShowText := not ggDownload.ShowText;
  if ggDownload.ShowText then
    pnShowProgressDownload.Caption := 'OCULTAR MENSAGEM'
  else
    pnShowProgressDownload.Caption := 'EXIBIR MENSAGEM';
end;

procedure TViewMain.pnStartDonwloadClick(Sender: TObject);
var
  Params: TParamsDownloadFile;
begin
  CheckParameters;

  Params.URL := edtUrlDonwload.Text;
  Params.PathSave := IncludeTrailingPathDelimiter(sbLocalDonwload.Text);

  FServiceDownload := TServiceDownload.Create(Params, OnProgressTransferStart);
  FServiceDownload.OnProgressTransferFinish := FinishDownloadUpdateControls;
  FServiceDownload.OnTerminate := OnProgressTransferEnd;
  FServiceDownload.FreeOnTerminate := True;

  StartDownloadUpdateControls;
  FBeginDownload := Now;
end;

procedure TViewMain.pnViewDownloadHistoryClick(Sender: TObject);
begin
  ViewDownloadHistory := TViewDownloadHistory.Create(Application);
  ViewDownloadHistory.ShowModal;
  ViewDownloadHistory.Free;
end;

procedure TViewMain.SaveDownloadDatabase;
var
  ServiceDatabase: TServiceDatabase;
  EntityDownload: TEntityDownload;
begin
  EntityDownload.UrlDownload := edtUrlDonwload.Text;
  EntityDownload.BeginDownload := FBeginDownload;
  EntityDownload.EndDownload := Now;

  ServiceDatabase := TServiceDatabase.Create;
  try
    ServiceDatabase.AddNewDownloadDatabase(EntityDownload);
  finally
    ServiceDatabase.Free;
  end;
end;

procedure TViewMain.StartDownloadUpdateControls;
begin
  pnCancelDonwload.Visible := True;
  pnShowProgressDownload.Visible := True;
  pnGgDownload.Visible := True;
  pnStartDonwload.Visible := False;

  ViewMain.Height := 317;

  Application.ProcessMessages;
end;

procedure TViewMain.CheckParameters;
begin
  if edtUrlDonwload.Text = '' then
    raise Exception.Create(StrEnterDownloadURL);

  if sbLocalDonwload.Text = '' then
    raise Exception.Create(StrTellLocationSaveFile);

  if not SysUtils.DirectoryExists(sbLocalDonwload.Text) then
    raise Exception.Create(StrTellLocationSaveFile);
end;

function TViewMain.DownloadInProgress: boolean;
begin
  Result := (ggDownload.Progress > 0);
end;

procedure TViewMain.FinishDownloadUpdateControls;
begin
  pnCancelDonwload.Visible := False;
  pnShowProgressDownload.Visible := False;
  pnGgDownload.Visible := False;
  ggDownload.Progress := 0;
  pnStartDonwload.Visible := True;

  ViewMain.Height := 272;
  Application.ProcessMessages;
end;

procedure TViewMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DownloadInProgress then
    if not TQuestion.Ask('Download em Andamento', 'Existe download em andamento, deseja interrompe-lo ?') then
    begin
      Action := caNone;
      Exit;
    end;

  Action := caNone;
  FServiceDownload.CancelDownload;
  Application.Terminate;
end;

procedure TViewMain.FormCreate(Sender: TObject);
begin
  ViewMain.Height := 272;
end;

procedure TViewMain.OnProgressTransferStart(ProgressCurrent: Integer);
begin
  ggDownload.Progress := ProgressCurrent;
  Application.ProcessMessages;
end;

procedure TViewMain.OnProgressTransferEnd(Sender: TObject);
begin
  if ggDownload.Progress < 100 then
    Exit;

  FinishDownloadUpdateControls;
  SaveDownloadDatabase;
end;

procedure TViewMain.pnCancelDonwloadClick(Sender: TObject);
begin
  FServiceDownload.CancelDownload;
end;

end.
