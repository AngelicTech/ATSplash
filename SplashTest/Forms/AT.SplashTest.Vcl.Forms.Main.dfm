object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Splash Test'
  ClientHeight = 131
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btnRunServer: TcxButton
    Left = 8
    Top = 8
    Width = 120
    Height = 32
    Caption = 'Run Splash Server'
    TabOrder = 0
    OnClick = btnRunServerClick
  end
  object btnShowSplash: TcxButton
    Left = 134
    Top = 8
    Width = 120
    Height = 32
    Caption = 'Show Splash Screen'
    TabOrder = 1
    OnClick = btnShowSplashClick
  end
  object btnHideSplash: TcxButton
    Left = 260
    Top = 8
    Width = 120
    Height = 32
    Caption = 'Hide Splash Screen'
    TabOrder = 2
    OnClick = btnHideSplashClick
  end
  object btnCloseSplash: TcxButton
    Left = 386
    Top = 8
    Width = 120
    Height = 32
    Caption = 'Close Splash Server'
    TabOrder = 3
    OnClick = btnCloseSplashClick
  end
  object txtSplashMessage: TcxButtonEdit
    Left = 8
    Top = 46
    ParentFont = False
    Properties.Buttons = <
      item
        Action = actSetStartMsg
        Default = True
        Kind = bkText
      end>
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 4
    Text = 'TEST'
    Width = 498
  end
  object btnStatus: TcxButton
    Left = 0
    Top = 99
    Width = 527
    Height = 32
    Align = alBottom
    Action = actStatus
    TabOrder = 5
    ExplicitTop = 89
    ExplicitWidth = 517
  end
  object sknctlMain: TdxSkinController
    NativeStyle = False
    ScrollbarMode = sbmHybrid
    SkinName = 'TheBezier'
    RenderMode = rmDirectX
    SkinPaletteName = 'Norwegian Wood'
    ShowFormShadow = bTrue
    Left = 360
    Top = 72
  end
  object alstMain: TActionList
    Left = 264
    Top = 72
    object actStatus: TAction
      Caption = 'Action1'
      OnUpdate = UpdateStatusAction
    end
    object actSetStartMsg: TAction
      Caption = 'Set Start Message'
      OnExecute = actSetStartMsgExecute
    end
  end
  object doscmdSplash: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    Left = 464
    Top = 88
  end
end
