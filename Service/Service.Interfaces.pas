unit Service.Interfaces;

interface

uses
  System.SysUtils;

type
  TProgressNotify = procedure(Progress: Integer) of object;

  TParamsDownloadFile = record
    URL: string;
    PathSave: string;
  end;

  IDownload = interface
    ['{A1AFCA4A-11C3-40D0-BFB3-EC52197F0241}']
    procedure DownloadFile(const Params: TParamsDownloadFile; OnUpdateProgress: TProgressNotify = nil;
      OnCancel: TFunc<Boolean> = nil); overload;
  end;

implementation

end.
