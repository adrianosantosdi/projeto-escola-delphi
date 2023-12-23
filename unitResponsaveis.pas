unit unitResponsaveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TfrmResponsaveis = class(TForm)
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    edtId: TEdit;
    Label2: TLabel;
    edtNomeCompleto: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtOperadora: TEdit;
    rgParantesco: TRadioGroup;
    DBGrid1: TDBGrid;
    maskCpf: TMaskEdit;
    maskCelular: TMaskEdit;
    maskRg: TMaskEdit;
    btnPesquisar: TButton;
    Label7: TLabel;
    edtPesquisar: TEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BotaoNovo;
    procedure BotaoSalvar;
    procedure BotaoEditar;
    procedure BotaoCancelar;
    procedure HabilitarEdits;
    procedure DesabilitarEdits;
    procedure LimparCampos;
    procedure Pesquisar;
    procedure ExcluirRegistro;
    procedure InserirCampos;
    procedure Update;
    procedure PopularEdits;
  end;

var
  frmResponsaveis: TfrmResponsaveis;

implementation

{$R *.dfm}

uses unitPrincipal, unitDM;

procedure TfrmResponsaveis.BotaoCancelar;
begin
  btnNovo.Enabled := true;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := true;
end;

procedure TfrmResponsaveis.BotaoEditar;
begin
  btnNovo.Enabled := false;
  btnSalvar.Enabled := true;
  btnEditar.Enabled := true;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := false;
end;

procedure TfrmResponsaveis.BotaoNovo;
begin
 btnNovo.Enabled := false;
 btnSalvar.Enabled := true;
 btnEditar.Enabled := true;
 btnCancelar.Enabled := true;
 btnExcluir.Enabled := false;
end;

procedure TfrmResponsaveis.BotaoSalvar;
begin
 btnNovo.Enabled := false;
 btnSalvar.Enabled := true;
 btnEditar.Enabled := true;
 btnCancelar.Enabled := true;
 btnExcluir.Enabled := true;
end;

procedure TfrmResponsaveis.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then;
  LimparCampos;
end;

procedure TfrmResponsaveis.btnEditarClick(Sender: TObject);
begin
  BotaoEditar;
  HabilitarEdits;
  PopularEdits;
end;

procedure TfrmResponsaveis.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then;
  ExcluirRegistro;
  Pesquisar;
end;

procedure TfrmResponsaveis.btnNovoClick(Sender: TObject);
begin
  BotaoNovo;
  HabilitarEdits;
end;

procedure TfrmResponsaveis.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmResponsaveis.btnSalvarClick(Sender: TObject);
begin
  if trim(edtId.Text) = '' then
     InserirCampos
  else
     Update;

  BotaoSalvar;
  LimparCampos;
end;

procedure TfrmResponsaveis.DesabilitarEdits;
begin
   edtNomeCompleto.Enabled := false;
  maskRg.Enabled := false;
  maskCpf.Enabled := false;
  maskCelular.Enabled := false;
  edtOperadora.Enabled := false;
  rgParantesco.Enabled := false;
end;

procedure TfrmResponsaveis.ExcluirRegistro;
var
  lID : Integer;
begin
  lID := DM.QryResponsaveis.FieldByName('id').AsInteger;

    with DM.QryResponsaveis do
    begin
      close;
      SQL.Clear;
      SQL.Add('delete from responsaveis where id = :pid');
      ParamByName('pid').AsInteger :=  lID;
      ExecSQL;
      MessageDlg('Registro deletado com sucesso', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmResponsaveis.HabilitarEdits;
begin
  edtNomeCompleto.Enabled := true;
  maskRg.Enabled := true;
  maskCpf.Enabled := true;
  maskCelular.Enabled := true;
  edtOperadora.Enabled := true;
  rgParantesco.Enabled := true;
end;

procedure TfrmResponsaveis.InserirCampos;
begin
  with DM.QryResponsaveis do
    begin
      close;
      SQL.Clear;
      SQL.Add('insert into responsaveis (nome, rg, cpf, celular, operadora, parantesco) values ');
      SQL.Add('(:pnome, :prg, :pcpf, :pcelular, :poperadora, :pparantesco)');
      ParamByName('pnome').AsString := edtNomeCompleto.Text;
      ParamByName('prg').AsString := maskRg.Text;
      ParamByName('pcpf').AsString := maskCpf.Text;
      ParamByName('pcelular').AsString := maskCelular.Text;
      ParamByName('poperadora').AsString := edtOperadora.Text;
      If rgParantesco.ItemIndex = 0 then
          ParamByName('pparantesco').asstring := 'Pai';
      if rgParantesco.ItemIndex = 1 then
          ParamByName('pparantesco').asstring := 'M�e'
        else
          ParamByName('pparantesco').asstring := 'Respons�vel' ;
      ExecSQL;
      if MessageDlg('Registro salvo com sucesso', mtConfirmation, [mbYes, mbNo], 0) = mrYes then;
      LimparCampos;
      Pesquisar;
    end;
end;

procedure TfrmResponsaveis.LimparCampos;
begin
  edtNomeCompleto.Text := '';
  maskRg.Text := '';
  maskCpf.Text := '';
  maskCelular.Text := '';
  edtOperadora.Text := '';
  rgParantesco.Caption := '';
end;

procedure TfrmResponsaveis.Pesquisar;
begin
  DM.QryResponsaveis.Close;
  DM.QryResponsaveis.SQL.Clear;

  DM.QryResponsaveis.SQL.Text := 'select * from responsaveis where nome like ' +  QuotedStr('%' + edtPesquisar.Text + '%') ;
  DM.QryResponsaveis.Open();
end;

procedure TfrmResponsaveis.PopularEdits;
begin
  edtId.Text := DM.QryResponsaveis.FieldByName('ID').AsString;
  edtNomeCompleto.Text := DM.QryResponsaveis.FieldByName('NOME').AsString;
  maskRg.Text := DM.QryResponsaveis.FieldByName('RG').AsString;
  maskCpf.Text := DM.QryResponsaveis.FieldByName('CPF').AsString;
  maskCelular.Text := DM.QryResponsaveis.FieldByName('CELULAR').AsString;
  edtOperadora.Text := DM.QryResponsaveis.FieldByName('OPERADORA').AsString;
  rgParantesco.Caption := DM.QryResponsaveis.FieldByName('PARANTESCO').AsString;
end;

procedure TfrmResponsaveis.Update;
begin
  with DM.QryResponsaveis do
    begin
      close;
      SQL.Clear;
      SQL.Add('update responsaveis               '+
               'set nome = :pnome,               '+
               '    rg   = :prg,                 '+
               '    cpf  = :pcpf,                '+
               '    celular =   :pcelular,       '+
               '    operadora = :poperadora,     '+
               '    parantesco = :pparantesco    '+
               '    where id = :pid             ');

    ParamByName('pid').AsInteger := StrToInt(edtId.Text);
    ParamByName('pnome').AsString := edtNomeCompleto.Text;
    ParamByName('prg').AsString := maskRg.Text;
    ParamByName('pcpf').AsString := maskCpf.Text;
    ParamByName('pcelular').AsString := maskCelular.Text;
    ParamByName('poperadora').AsString := edtOperadora.Text;
    ParamByName('pparantesco').AsString := rgParantesco.Caption;
    ExecSQL;
    end;
end;

end.
