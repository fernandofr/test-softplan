unit View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
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
  Vcl.Samples.Gauges;

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
    procedure sbLocalDonwloadInvokeSearch(Sender: TObject);
    procedure pnStartDonwloadClick(Sender: TObject);
    procedure pnCancelDonwloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnShowProgressDownloadClick(Sender: TObject);
    {$ENDREGION}
  private
    FServiceDownload: TServiceDownload;
    procedure OnProgressTransferStart(ProgressCurrent: Integer);
    procedure OnProgressTransferEnd(Sender: TObject);
    procedure StartDownloadUpdateControls;
    procedure FinishDownloadUpdateControls;
  public

  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

uses
  Service.Consts;

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
  Params.URL := edtUrlDonwload.Text;
  Params.PathSave := IncludeTrailingPathDelimiter(sbLocalDonwload.Text);

  FServiceDownload := TServiceDownload.Create(Params, OnProgressTransferStart);
  FServiceDownload.OnProgressTransferFinish := FinishDownloadUpdateControls;
  FServiceDownload.OnTerminate := OnProgressTransferEnd;
  FServiceDownload.FreeOnTerminate := True;

  StartDownloadUpdateControls;
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

procedure TViewMain.FinishDownloadUpdateControls;
begin
  pnCancelDonwload.Visible := False;
  pnShowProgressDownload.Visible := False;
  pnGgDownload.Visible := False;
  ggDownload.Progress := 0;
  pnStartDonwload.Visible := True;

  ViewMain.Height := 272;
  Application.ProcessMessages;
  FServiceDownload.Terminate;
end;

procedure TViewMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  FServiceManager.Free;
//  FServiceDownload.Terminate
end;

procedure TViewMain.FormCreate(Sender: TObject);
begin
  ViewMain.Height := 272;
//  FServiceManager := TServiceManager.Create;
//  FServiceManager.OnUpdateView :=  OnProgress;
end;

procedure TViewMain.OnProgressTransferStart(ProgressCurrent: Integer);
begin
  ggDownload.Progress := ProgressCurrent;
  Application.ProcessMessages;

//  memDownload.DisableControls;
//  try
//    if memDownload.Locate('IDENTIFY', ID, []) then
//    begin
//      memDownload.Edit;
//      memDownloadPROGRESS.Value := ProgressCurrent;
//      memDownload.Post;
//    end;
//  finally
//    memDownload.EnableControls;
//    Application.ProcessMessages;
//  end;
end;

procedure TViewMain.OnProgressTransferEnd(Sender: TObject);
begin
  if ggDownload.Progress = 100 then
    FinishDownloadUpdateControls;
end;

procedure TViewMain.pnCancelDonwloadClick(Sender: TObject);
begin
  FServiceDownload.CancelDownload;
end;

//Initialization
//  ReportMemoryLeaksOnShutdown := (DebugHook <> 0);
end.
