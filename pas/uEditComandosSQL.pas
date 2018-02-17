unit uEditComandosSQL;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, Padrao1, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxMemo, FMTBcd, DB, SqlExpr,
  Buttons, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, Provider,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, DbClient,
  Grids, DBGrids;

type
  TfrmEditComandosSQL = class(TfrmPadrao1)
    Panel: TPanel;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    btnLimpar: TButton;
    btnFechar: TBitBtn;
    btnRun: TBitBtn;
    btnOcultTrigProc: TBitBtn;
    btnAbir: TBitBtn;
    OpenDialog1: TOpenDialog;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Qry1: TSQLQuery;
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOcultTrigProcClick(Sender: TObject);
    procedure btnAbirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure ExecutaConsulta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditComandosSQL: TfrmEditComandosSQL;

implementation

uses udmPrincipal, gsLib, UtilsDb;

{$R *.dfm}

procedure TfrmEditComandosSQL.btnAbirClick(Sender: TObject);
Var
   slTexto: TStringList;
begin
   if not OpenDialog1.Execute then exit;
   slTexto := TStringList.Create;
   slTexto.LoadFromFile(OpenDialog1.FileName);
   Memo1.Lines.Clear;
   Memo1.Text := slTexto.Text;
end;

procedure TfrmEditComandosSQL.btnLimparClick(Sender: TObject);
begin
   Memo1.Lines.Clear;
   cds1.Close;
   Memo1.SetFocus;
end;

procedure TfrmEditComandosSQL.btnOcultTrigProcClick(Sender: TObject);
Var
  iErro: Integer;
  dDtAtual: TDate;
  oQry1 : TSQLQuery;
begin

  //slComandoSQL := TStringList.Create;

  Screen.Cursor := crHourGlass;

  iErro := 0;
  if not OcultaTriggers_e_procs then iErro := 1;

  Screen.Cursor := crDefault;

  if iErro = 0 then
  begin

     dDtAtual := StrToDate(LeftStr(DateToStr(Date),10));
     oQry1 := TSQLQuery.Create(Self);
     oQry1.SQLConnection := dmPrincipal.SConPrincipal;
     oQry1.sql.Add('update config_sistema set dt_ver_db = :pDt where id = 1');
     oQry1.Params[0].AsDate := dDtAtual;
     try
        oQry1.ExecSQL;
     finally
        FreeAndNil(oQry1);
     end;

     Mensagem('Operação realizada com sucesso ...',
        'Aviso !!!',MB_OK+MB_ICONEXCLAMATION);
  end;

end;

procedure TfrmEditComandosSQL.btnRunClick(Sender: TObject);
Var
  iErro,
  iConta: Integer;
  lConsulta: Boolean;
begin

  //slComandoSQL := TStringList.Create;

  iErro := 0;
  if Memo1.Lines.Count = 0 then exit;

  lConsulta := False;
  iConta := 0;
  while iConta <= Memo1.Lines.Count - 1 do
  begin
     if (LeftStr(UpperCase(Memo1.Lines[iConta]),6) = 'CREATE') or
        (LeftStr(UpperCase(Memo1.Lines[iConta]),11) = 'ALTER TABLE') then
     begin
        lConsulta := False;
        break;
     end;
     if (Trim(Memo1.Lines[iConta]) <> '') and
        (Trim(Memo1.Lines[iConta]) <> '//') then
     begin
        if UpperCase(LeftStr(Trim(Memo1.Lines[iConta]),6)) = 'SELECT' then
        begin
           lConsulta := True;
           Break;
        end;
     end;
     Inc(iConta);
  end;

  if lConsulta then
     ExecutaConsulta
  else
  begin
     try
        dmPrincipal.SConPrincipal.ExecuteDirect(Memo1.Text);
     except
        on E: Exception do
        begin
          iErro := 1;
          Mensagem('Não foi possível executar essas instruções ...'+#13+
            '('+E.Message+')',
            'E R R O !!!',MB_OK+MB_ICONERROR);
        end;
     end;
     if iErro = 0 then
        Mensagem('Operação realizada com sucesso ...',
           'Aviso !!!',MB_OK+MB_ICONEXCLAMATION);
  end;

end;

procedure TfrmEditComandosSQL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  dmPrincipal.SConPrincipal.Connected := False;
  dmPrincipal.SConPrincipal.Connected := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmEditComandosSQL.FormCreate(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
end;

procedure TfrmEditComandosSQL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   case Key of
      VK_F9:btnLimparClick(Self);
   end;
end;

procedure TfrmEditComandosSQL.FormShow(Sender: TObject);
begin
  inherited;
  Memo1.SetFocus;
end;

procedure TfrmEditComandosSQL.ExecutaConsulta;
Var
   iErro,
   iConta: integer;
begin
   iErro := 0;
   cds1.Close;
   Qry1.SQL.Clear;
   for iConta := 0 to Memo1.Lines.Count - 1 do
      Qry1.SQL.Add(Memo1.Lines[iConta]);

   try
      cds1.Open;
   except
      on E: Exception do
      begin
        iErro := 1;
        Mensagem('Não foi possível executar essa Consulta ...'+#13+
          '('+E.Message+')',
          'E R R O !!!',MB_OK+MB_ICONERROR);
      end;
   end;
   if iErro = 0 then
   begin
      DBGrid1.SetFocus;
   end;
{
      Mensagem('Operação realizada com sucesso ...',
         'Aviso !!!',MB_OK+MB_ICONEXCLAMATION);
}
end;

end.
