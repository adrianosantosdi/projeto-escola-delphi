object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Gest'#227'o de Escola'
  ClientHeight = 630
  ClientWidth = 941
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 712
    Top = 160
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Responsveis1: TMenuItem
        Caption = 'Respons'#225'veis'
        OnClick = Responsveis1Click
      end
      object Alunos1: TMenuItem
        Caption = 'Alunos'
        OnClick = Alunos1Click
      end
      object Series1: TMenuItem
        Caption = 'Series'
        OnClick = Series1Click
      end
    end
  end
end
