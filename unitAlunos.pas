unit unitAlunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TfrmAlunos = class(TForm)
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    Label7: TLabel;
    btnPesquisar: TButton;
    edtPesquisar: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    edtId: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtBairro: TEdit;
    Label5: TLabel;
    edtCidade: TEdit;
    Label6: TLabel;
    edtUf: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtOperadora: TEdit;
    Label11: TLabel;
    edtEmail: TEdit;
    Label12: TLabel;
    edtAutorizado: TEdit;
    rgEnsinoReligioso: TRadioGroup;
    Label13: TLabel;
    DBGrid1: TDBGrid;
    maskCep: TMaskEdit;
    maskCelular: TMaskEdit;
    cbResponsavel: TComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BotaoNovo;
    procedure BotaoSalvar;
    procedure BotaoEditar;
    procedure BotaoCancelar;
    procedure BotaoExcluir;
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure InserirDados;
  end;

var
  frmAlunos: TfrmAlunos;

implementation

{$R *.dfm}

uses unitDM, unitPrincipal, unitResponsaveis;

{ TfrmAlunos }

procedure TfrmAlunos.BotaoCancelar;
begin
  btnNovo.Enabled := true;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := true;
end;

procedure TfrmAlunos.BotaoEditar;
begin
  btnNovo.Enabled := false;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := false;
end;

procedure TfrmAlunos.BotaoExcluir;
begin
   btnNovo.Enabled := true;
   btnSalvar.Enabled := true;
   btnEditar.Enabled := true;
   btnExcluir.Enabled:=true;
end;

procedure TfrmAlunos.BotaoNovo;
begin
 btnNovo.Enabled := false;
 btnSalvar.Enabled := true;
 btnEditar.Enabled := true;
 btnCancelar.Enabled := true;
 btnExcluir.Enabled := false;
end;

procedure TfrmAlunos.BotaoSalvar;
begin
 btnNovo.Enabled := false;
 btnSalvar.Enabled := true;
 btnEditar.Enabled := true;
 btnCancelar.Enabled := true;
 btnExcluir.Enabled := true;
end;

procedure TfrmAlunos.btnNovoClick(Sender: TObject);
begin
  if MessageDlg('Deseja criar um novo registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then

  HabilitarBotoes;
end;

procedure TfrmAlunos.btnSalvarClick(Sender: TObject);
begin
  InserirDados;
end;

procedure TfrmAlunos.DesabilitarBotoes;
begin
  edtNome.Enabled := false;
  edtEndereco.Enabled := false;
  edtBairro.Enabled := false;
  edtCidade.Enabled := false;
  edtUf.Enabled := false;
  maskCep.Enabled := false;
  maskCelular.Enabled := false;
  edtOperadora.Enabled := false;
  edtEmail.Enabled  := false;
  edtAutorizado.Enabled := false;
  rgEnsinoReligioso.Enabled := false;
  cbResponsavel.Enabled := false;
end;

procedure TfrmAlunos.HabilitarBotoes;
begin
  edtNome.Enabled := true;
  edtEndereco.Enabled := true;
  edtBairro.Enabled := true;
  edtCidade.Enabled := true;
  edtUf.Enabled := true;
  maskCep.Enabled := true;
  maskCelular.Enabled := true;
  edtOperadora.Enabled := true;
  edtEmail.Enabled  := true;
  edtAutorizado.Enabled := true;
  rgEnsinoReligioso.Enabled := true;
  cbResponsavel.Enabled := true;
end;

procedure TfrmAlunos.InserirDados;
begin
  with DM.QryAlunos do
    begin
      close;
      SQL.Clear;
      SQL.Add('insert into alunos (nome, endereco, bairro, cidade, uf, cep, celular, operadora,');
      SQL.Add('email, autorizado_sair_com, ensino_religioso, responsavel_carne) values ');
      SQL.Add('(:pnome, :pendereco, :pbairro, :pcidade, :puf, :pcep, :pcelular, :poperadora,');
      SQL.Add(':pemail, :pautorizado_sair_com, :pensino_religioso, :presponsavel_carne)');
      ParamByName('pnome').AsString := edtNome.Text;
      ParamByName('pendereco').AsString := edtEndereco.Text;
      ParamByName('pbairro').AsString := edtBairro.Text;
      ParamByName('pcidade').AsString := edtCidade.Text;
      ParamByName('puf').AsString := edtUf.Text;
      ParamByName('pcep').AsString := maskCep.Text;
      ParamByName('pcelular').AsString := maskCelular.Text;
      ParamByName('poperadora').AsString := edtOperadora.Text;
      ParamByName('pemail').AsString := edtEmail.Text;
      ParamByName('pautorizado_sair_com').AsString := edtAutorizado.Text;
      if rgEnsinoReligioso.ItemIndex = 0 then
        ParamByName('pensino_religioso').AsString := 'S'
        else
         ParamByName('pensino_religioso').AsString := 'N';
      ParamByName('presponsavel_carne').AsString := cbResponsavel.Text;
      ExecSQL;
    end;
end;

end.
