unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConne: TFDConnection;
    QryResponsaveis: TFDQuery;
    dsResponsaveis: TDataSource;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    QryAlunos: TFDQuery;
    dsAlunos: TDataSource;
    QryAlunosid: TFDAutoIncField;
    QryAlunosnome: TStringField;
    QryAlunosendereco: TStringField;
    QryAlunosbairro: TStringField;
    QryAlunoscidade: TStringField;
    QryAlunosuf: TStringField;
    QryAlunoscep: TStringField;
    QryAlunoscelular: TStringField;
    QryAlunosoperadora: TStringField;
    QryAlunosemail: TStringField;
    QryAlunosautorizado_sair_com: TStringField;
    QryAlunosensino_religioso: TStringField;
    QryAlunosresponsavel_carne: TIntegerField;
    QrySeries: TFDQuery;
    dsSeries: TDataSource;
    QrySeriesid: TFDAutoIncField;
    QrySeriesnome: TStringField;
    QrySeriesvalor_mensalidade: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unitPrincipal, unitResponsaveis, unitAlunos, unitSeries;

{$R *.dfm}

end.
