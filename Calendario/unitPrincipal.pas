unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, IBX.IBTable;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lb_Municipio: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    gravar: TBitBtn;
    novo: TBitBtn;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    cod_feriado: TDBEdit;
    cod_Municipio: TDBEdit;
    nome_feriado: TDBEdit;
    data: TDBEdit;
    tipo_data: TDBComboBox;
    tipo_feriado: TDBComboBox;
    tipo_horario: TDBComboBox;
    horario_inicio: TDBEdit;
    horario_fim: TDBEdit;
    dia_Mes: TDBEdit;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    excluir: TBitBtn;
    cancelar: TBitBtn;
    alterar: TBitBtn;
    IBTable1: TIBTable;
    IBTable1CODIGO_FERIADO: TIntegerField;
    IBTable1NOME_FERIADO: TIBStringField;
    IBTable1DATA: TDateField;
    IBTable1CODIGO_MUNICIPIO: TIntegerField;
    IBTable1TIPO: TIBStringField;
    IBTable1DIA_MES: TIBStringField;
    IBTable1TIPO_DATA: TIBStringField;
    IBTable1TIPO_HORARIO: TIBStringField;
    IBTable1HORA_INICIO: TIBStringField;
    IBTable1HORA_FIM: TIBStringField;
    procedure tipo_FeriadoChange(Sender: TObject);
    procedure tipo_DataChange(Sender: TObject);
    procedure tipo_horarioChange(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure novoClick(Sender: TObject);
    procedure excluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure excluirClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure alterarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure novoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure gravarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure alterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure inativaCampos;
    procedure ativaCampos;
    procedure ativarBotao;
    procedure inativarBotao;




  public
    { Public declarations }


  end;
var
  Form4: TForm4;

implementation

{$R *.dfm}

uses  unitValidarCampos;


procedure TForm4.ativaCampos;
begin
  cod_feriado.Enabled := true;
  nome_feriado.Enabled := true;
  tipo_feriado.Enabled := true;
  tipo_data.Enabled := true;
  tipo_horario.Enabled := true;
  data.Enabled := true;


end;

procedure TForm4.ativarBotao;
begin
  gravar.Enabled := true;
end;

procedure TForm4.alterarClick(Sender: TObject);
begin
//IBQuery1.Edit;
 IBTable1.Edit;
 ativaCampos;
end;

procedure TForm4.alterarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  alterar.Caption := 'Alterar';
end;

procedure TForm4.cancelarClick(Sender: TObject);
begin
//IBQuery1.Cancel;
   IBTable1.Cancel;
   inativaCampos;
end;

procedure TForm4.cancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  cancelar.Caption := 'Cancelar';
end;

procedure TForm4.excluirClick(Sender: TObject);
begin
//IBQuery1.Delete;

  if (Application.MessageBox('Deseja excluir esse registro?','Confirma??o',MB_ICONQUESTION + MB_USEGLYPHCHARS)= mrYes) then
    begin
      IBTable1.Delete;

    end;
  ShowMessage('Registro excluido com sucesso');
  inativaCampos;
end;

procedure TForm4.excluirMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  excluir.Caption := 'Excluir';
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  inativaCampos;
// IBQuery1.Open();
   IBTable1.Open();

end;

procedure TForm4.gravarClick(Sender: TObject);
begin
  pcrValidarCamposObrigatorios(Form4);
  inativaCampos;
//  IBQuery1.Post;
  IBTable1.Post;

  ShowMessage('Dados salvos com sucesso');
end;

procedure TForm4.gravarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  gravar.Caption := 'Gravar';
end;

procedure TForm4.inativaCampos;
begin
  cod_feriado.Enabled := false;
  cod_Municipio.Enabled := false;
  nome_feriado.Enabled := false;
  tipo_feriado.Enabled := false;
  tipo_data.Enabled := false;
  tipo_horario.Enabled := false;
  data.Enabled := false;
  dia_Mes.Enabled := false;
  horario_inicio.Enabled := false;
  horario_fim.Enabled := false;

end;

procedure TForm4.inativarBotao;
begin
  gravar.Enabled := false;
end;

procedure TForm4.novoClick(Sender: TObject);
begin
  ativaCampos;
  // IBQuery1.Insert;
  IBTable1.Insert;
end;

procedure TForm4.novoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  novo.Caption := 'Novo';
end;

procedure TForm4.Panel3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  excluir.Caption := '';
  cancelar.Caption := '';
  alterar.Caption := '';
  novo.Caption := '';
  gravar.Caption := '';
end;

procedure TForm4.tipo_DataChange(Sender: TObject);
begin
  case tipo_Data.ItemIndex of
    0:
    if tipo_data.ItemIndex = 0 then
     begin
       dia_Mes.Clear;
       dia_Mes.Enabled := false;
     end;

















//----------------------------
	1:


    dia_Mes.Enabled := true;


















  end;
end;

procedure TForm4.tipo_FeriadoChange(Sender: TObject);
begin
case tipo_Feriado.ItemIndex of

	0:

    cod_Municipio.Enabled := true;




















//----------------------------
	1:



  if tipo_feriado.ItemIndex = 1 then
     begin
       cod_Municipio.Clear;
       cod_Municipio.Enabled := false;
     end;
















	2:

    if tipo_feriado.ItemIndex = 2  then
     begin
       cod_Municipio.Clear;
       cod_Municipio.Enabled := false;
     end;









//---------------
//---------------
//--------------
//---------------
//------------
end;
end;

procedure TForm4.tipo_horarioChange(Sender: TObject);
begin
case tipo_horario.ItemIndex of
    0:
      if tipo_horario.ItemIndex = 0 then
         begin
            horario_inicio.Enabled := false;
            horario_fim.Enabled := false;
            horario_inicio.Clear;
            horario_fim.Clear;
         end;
















//----------------------------
	1:


    if tipo_horario.ItemIndex = 1 then
         begin
            horario_inicio.Enabled := true;
            horario_fim.Enabled := true;
         end;












end;
end;

end.



