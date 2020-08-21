unit View.DownloadHistory;

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
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Data.DB,
  Service.Database;

type
  TViewDownloadHistory = class(TForm)
    Panel1: TPanel;
    pnlTitulo: TPanel;
    lnInformacao: TLabel;
    imgNotificacao: TImage;
    pnInformacoes: TPanel;
    gridHystoryDownload: TDBGrid;
    dsDownloadHistory: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FServiceDatabase: TServiceDatabase;
  public

  end;

var
  ViewDownloadHistory: TViewDownloadHistory;

implementation

{$R *.dfm}

procedure TViewDownloadHistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FServiceDatabase.Free;
end;

procedure TViewDownloadHistory.FormCreate(Sender: TObject);
begin
  FServiceDatabase := TServiceDatabase.Create;
end;

procedure TViewDownloadHistory.FormShow(Sender: TObject);
begin
  dsDownloadHistory.DataSet := FServiceDatabase.ListCompletedDownloads;
end;

end.
