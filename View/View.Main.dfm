object ViewMain: TViewMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  ClientHeight = 285
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 7829367
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 285
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlTitulo: TPanel
      Left = 0
      Top = 0
      Width = 810
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentBackground = False
      TabOrder = 0
      object lnInformacao: TLabel
        AlignWithMargins = True
        Left = 70
        Top = 0
        Width = 251
        Height = 60
        Margins.Left = 10
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'Gerenciador de Donwload'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10569485
        Font.Height = -18
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object imgNotificacao: TImage
        Left = 10
        Top = 10
        Width = 50
        Height = 50
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F9870000000467414D410000B18F0BFC61050000000173
          52474200AECE1CE900000006624B4744000000000000F943BB7F000000097048
          597300000048000000480046C96B3E000001A24944415478DAEDD93F4FC24018
          06F0F76D594C0475D75937FD14AD6E4E10097F1A772717BF84717750D0188DC4
          98B858485CF533B8AAAB31B6240C80E75BA7D2008DF4AE4793F7997A25BD3E3F
          DA5BAE08190FEA2EC000DD05940016ACB3B51CE64E008445C3BCE68E3EF57802
          348F7CB7FA1A0BC85BE71B80C6331DAE682E1ECDD7400C377B9DFDF7E900BB71
          4FA77775B71D1B215A7EC729C6009A1EE87F6D26C5F3DBF5A53880088FE902AD
          0B3DAE0F031830AF80B4E661000318C00006CC27405618C080AC0232BF8819C0
          80843796150630400320D1C6D63870C16E96A9C5051D9A093DDF34FF720C20D9
          D6621420B17C50F6D66BD74BD301DB97EB207E5E60C6CDDD30406679CAE7C030
          B77A8F958FA980207FDBEB601C03A21DF4980520B1BC4713BA7DC33C8C969F08
          F84FC62DB245BB5144C02B1AE6423F0D85C04AB753BB497A4FA50001A2945679
          2580A02C8CBE367D42ED75DBCE9DECF2AA0023184451F55CE75A4579D500E5E5
          550252292F0B107C745B0D9D1A08C472D7ADB5549797022858CD1D81701A20E8
          51BCD13F7FE0BBCE431AE5A500748701BA9379C02FC9F382401FFD4E1F000000
          2574455874646174653A63726561746500323031392D30362D30325431373A30
          303A30312B30303A30308865DFE50000002574455874646174653A6D6F646966
          7900323031392D30362D30325431373A30303A30312B30303A3030F938675900
          000028744558747376673A626173652D7572690066696C653A2F2F2F746D702F
          6D616769636B2D3564426630533844379C4AD00000000049454E44AE426082}
      end
    end
    object pnInformacoes: TPanel
      Left = 0
      Top = 73
      Width = 810
      Height = 212
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 20
      Padding.Top = 10
      Padding.Right = 20
      Padding.Bottom = 10
      ParentBackground = False
      TabOrder = 1
      object Label3: TLabel
        AlignWithMargins = True
        Left = 10
        Top = -4
        Width = 102
        Height = 22
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'URL Download'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10569485
        Font.Height = -14
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label1: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 53
        Width = 127
        Height = 22
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'Local para Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10569485
        Font.Height = -14
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
      end
      object edtUrlDonwload: TEdit
        Left = 10
        Top = 19
        Width = 776
        Height = 27
        BevelInner = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7829367
        Font.Height = -14
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 
          'https://github.com/infinitered/reactotron/releases/download/v3.0' +
          '.0-beta.9/Reactotron-Setup-3.0.0-beta.9.exe'
      end
      object sbLocalDonwload: TSearchBox
        Left = 10
        Top = 78
        Width = 776
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7829367
        Font.Height = -14
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'C:\Users\Delphi\Desktop\temp'
        OnInvokeSearch = sbLocalDonwloadInvokeSearch
      end
      object pnCancelDonwload: TPanel
        Left = 536
        Top = 115
        Width = 250
        Height = 41
        BevelOuter = bvNone
        Caption = 'CANCELAR DOWNLOAD'
        Color = 4678655
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = pnCancelDonwloadClick
      end
      object pnStartDonwload: TPanel
        Left = 536
        Top = 115
        Width = 250
        Height = 41
        BevelOuter = bvNone
        Caption = 'INICIAR DOWNLOAD'
        Color = 10569485
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        OnClick = pnStartDonwloadClick
      end
      object pnShowProgressDownload: TPanel
        Left = 273
        Top = 115
        Width = 250
        Height = 41
        BevelOuter = bvNone
        Caption = 'EXIBIR MENSAGEM'
        Color = 11829830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
        Visible = False
        OnClick = pnShowProgressDownloadClick
      end
      object pnGgDownload: TPanel
        Left = 20
        Top = 180
        Width = 770
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 5
        Visible = False
        object ggDownload: TGauge
          Left = 0
          Top = 0
          Width = 770
          Height = 22
          Align = alClient
          BackColor = 14474460
          BorderStyle = bsNone
          Color = clWhite
          ForeColor = 3329330
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Progress = 0
          ShowText = False
          ExplicitLeft = -20
          ExplicitTop = 4
          ExplicitWidth = 781
          ExplicitHeight = 17
        end
      end
      object pnViewDownloadHistory: TPanel
        Left = 10
        Top = 115
        Width = 250
        Height = 41
        BevelOuter = bvNone
        Caption = 'EXIBIR HIST'#211'RICO DE DOWNLOADS'
        Color = 11814530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
        OnClick = pnViewDownloadHistoryClick
      end
    end
  end
end
