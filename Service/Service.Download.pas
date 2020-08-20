unit Service.Download;

interface

uses
  System.Classes,
  System.Generics.Collections,
  System.SysUtils,
  Service.Consts,
  IdHTTP,
  IdComponent,
  IdAuthentication,
  IdSSLOpenSSL,
  System.StrUtils;

type
  TServiceDownload = class(TThread)
  private
    FHTTP: TIdHTTP;
    FParams: TParamsDownloadFile;
    FCancelDownload: Boolean;
    FOnUpdateProgress: TProgressNotify;
    FOnProgressTransferFinish: TProc;
    procedure DownloadFile;
    procedure SetupHTTP;
    procedure SetupIdHTTP;
    procedure ProgressTransfer(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    function GetFileName: string;
    function DirectoryWithFileName: string;
  protected
    procedure Execute; override;
  public
    constructor Create(const Params: TParamsDownloadFile; OnUpdateProgress: TProgressNotify = nil);
    destructor Destroy; override;
    procedure CancelDownload;
    property OnProgressTransferFinish: TProc read FOnProgressTransferFinish write FOnProgressTransferFinish;
  end;

implementation

uses
  ComObj,
  ActiveX;

constructor TServiceDownload.Create(const Params: TParamsDownloadFile; OnUpdateProgress: TProgressNotify);
begin
  inherited Create;
  FreeOnTerminate := True;

  FParams := Params;
  FOnUpdateProgress := OnUpdateProgress;
  SetupHTTP;
end;

destructor TServiceDownload.Destroy;
begin
  FHTTP.Free;
  inherited;
end;

function TServiceDownload.DirectoryWithFileName: string;
begin
  Result := FParams.PathSave + GetFileName;
end;

procedure TServiceDownload.DownloadFile;
var
  FileDownload : TFileStream;
begin
  FileDownload := TFileStream.Create(DirectoryWithFileName, fmCreate);
  try
    FHTTP.Get(FParams.URL, FileDownload);
  finally
    FileDownload.Free;
  end;
end;

procedure TServiceDownload.Execute;
begin
  inherited;
  DownloadFile;
end;

function TServiceDownload.GetFileName: string;
begin
  Result := ReverseString(Copy(ReverseString(FParams.URL), 0, Pos('/', ReverseString(FParams.URL)) - 1));
end;

procedure TServiceDownload.ProgressTransfer(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
var
  HTTP: TIdHTTP;
  ContentLength: Int64;
  Percentage: Integer;
begin
  if not Assigned(FOnUpdateProgress) then
    Exit;

  HTTP := TIdHTTP(ASender);
  ContentLength := HTTP.Response.ContentLength;

  Percentage := 0;
  if (Pos('chunked', LowerCase(HTTP.Response.TransferEncoding)) = 0) and (ContentLength > 0) then
    Percentage := 100 * AWorkCount div ContentLength;

  if (Percentage >= 0) or (Percentage <= 100) then
    FOnUpdateProgress(Percentage);

  if FCancelDownload then
  begin
    HTTP.Disconnect;
    Abort;
  end;
end;

procedure TServiceDownload.SetupHTTP;
begin
  FHTTP := TIdHTTP.Create(nil);
  FHTTP.OnWork := ProgressTransfer;

  SetupIdHTTP;
end;

procedure TServiceDownload.SetupIdHTTP;
var
  IOHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  FHTTP.HandleRedirects := True;

  IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(FHTTP);
  IOHandler.SSLOptions.SSLVersions := [sslvTLSv1_1, sslvTLSv1_2];

  FHTTP.IOHandler := IOHandler;
end;

procedure TServiceDownload.CancelDownload;
begin
  FCancelDownload := True;

  if Assigned(FOnProgressTransferFinish) then
    FOnProgressTransferFinish;
end;

end.
