unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Responsveis1: TMenuItem;
    Alunos1: TMenuItem;
    Series1: TMenuItem;
    procedure Responsveis1Click(Sender: TObject);
    procedure Alunos1Click(Sender: TObject);
    procedure Series1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unitResponsaveis, unitAlunos, unitDM, unitSeries;

procedure TfrmPrincipal.Alunos1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmAlunos, frmAlunos);
    frmAlunos.ShowModal;
  finally
    FreeAndNil(frmAlunos);
  end;
end;

procedure TfrmPrincipal.Responsveis1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmResponsaveis, frmResponsaveis);
    frmResponsaveis.ShowModal
  finally
    FreeAndNil(frmResponsaveis);
  end;
end;

procedure TfrmPrincipal.Series1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmSeries, frmSeries);
    frmSeries.ShowModal;
  finally
    FreeAndNil(frmSeries);
  end;
end;

end.
