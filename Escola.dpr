program Escola;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {frmPrincipal},
  unitResponsaveis in 'unitResponsaveis.pas' {frmResponsaveis},
  unitDM in 'unitDM.pas' {DM: TDataModule},
  unitAlunos in 'unitAlunos.pas' {frmAlunos},
  unitSeries in 'unitSeries.pas' {frmSeries};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
