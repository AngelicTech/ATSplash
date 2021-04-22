object MainForm: TMainForm
  Left = 300
  Top = 300
  BorderStyle = bsNone
  Caption = 'MainForm'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnl1'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 320
    ExplicitTop = 296
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
  object HYModuleManager1: THYModuleManager
    AutoLoad = False
    ResolveInterfacesToOwner = True
    EnforceSecurity = False
    Left = 72
    Top = 32
  end
  object sknctl1: TdxSkinController
    SkinName = 'Xmas2008Blue'
    Left = 368
    Top = 192
  end
end
