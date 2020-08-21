unit Service.Database;

interface

uses
  DAO.Connection,
  Service.Consts,
  FireDAC.Comp.DataSet,
  Data.DB,
  FireDAC.Comp.Client;

type
  TServiceDatabase = class
  private
    FEntityDownload: TEntityDownload;
    FListCompletedDownloads: TFDMemTable;
    procedure ValidateParameters;
    procedure InsertDownload;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddNewDownloadDatabase(const EntityDownload: TEntityDownload);
    function ListCompletedDownloads: TFDMemTable;
  end;

implementation

uses
  System.SysUtils;

constructor TServiceDatabase.Create;
begin

end;

destructor TServiceDatabase.Destroy;
begin
  if Assigned(FListCompletedDownloads) then
    FreeAndNil(FListCompletedDownloads);

  inherited;
end;

procedure TServiceDatabase.AddNewDownloadDatabase(const EntityDownload: TEntityDownload);
begin
  FEntityDownload := EntityDownload;
  ValidateParameters;
  InsertDownload;
end;

procedure TServiceDatabase.ValidateParameters;
begin
  Assert(FEntityDownload.UrlDownload <> '');
  Assert(FEntityDownload.BeginDownload <> StrtoDateTime('30/12/1899'));
  Assert(FEntityDownload.EndDownload <> StrtoDateTime('30/12/1899'));
end;

procedure TServiceDatabase.InsertDownload;
begin
  Connection.ClearQuery;
  Connection
    .Query
    .ExecSQL('INSERT INTO LOGDOWNLOAD (URL, START_DATE, END_DATE) values (:URL, :START_DATE, :END_DATE)',
      [FEntityDownload.UrlDownload, FEntityDownload.BeginDownload, FEntityDownload.EndDownload]
    );
end;

function TServiceDatabase.ListCompletedDownloads: TFDMemTable;
begin
  if not Assigned(FListCompletedDownloads) then
    FListCompletedDownloads := TFDMemTable.Create(nil);

  Connection.ClearQuery;
  Connection
    .GetConnection
    .ExecSQL('SELECT * FROM LOGDOWNLOAD', TDataset(FListCompletedDownloads));

  Result := FListCompletedDownloads;
end;

end.
