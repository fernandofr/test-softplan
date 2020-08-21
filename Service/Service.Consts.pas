unit Service.Consts;

interface

uses
  System.SysUtils;

type
  TProgressNotify = procedure(Progress: Integer) of object;

  TParamsDownloadFile = record
    URL: string;
    PathSave: string;
  end;

  TEntityDownload = record
    UrlDownload: string;
    BeginDownload: TDateTime;
    EndDownload: TDateTime;
  end;

implementation

end.
