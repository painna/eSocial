unit uESocial;

interface

Uses
   SysUtils, WinTypes, WinProcs, Classes, Messages, Controls, DateUtils, Db,
   Forms, Dialogs, stdCtrls, DBClient, cxGridTableView, StrUtils, Graphics,
   Variants, SqlExpr, JPEG, Mask, DbCtrls, ExtCtrls, ShellApi, IniFiles;


   function fncRetornaUF(pUf:String):String;


   procedure prcS1000(pModoLancamento:String; pConexao:TSQLConnection);

   function fncvrSubteto1000(pAnoMesTrab:STring; pConexao:TSQLConnection):String;

implementation

uses udmPrincipal, VarGlobais, UtilsDb, Windows, gsLib, VareSocial;


function fncvrSubteto1000(pAnoMesTrab:String; pConexao:TSQLConnection):String;
var
   oQry1: TSQLQuery;
begin
   glb_iError:=0;
   try
      try
         oQry1:=TSQLQuery.Create(Nil);
         oQry1.SQLConnection:=pConexao;
         with oQry1 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('select * from SAL_MINIMO ');
         end;
      except on E:EDataBaseError do
         begin
            mensagem('Erro ao consultar dados no banco...'+#13+
                     'Mensagem: '+E.Message, 'Error!', MB_OK+MB_ICONERROR);
         end;
      end;
   finally
      FreeAndNil(oQry1);
   end;
end;

//dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

procedure prcS1000(pModoLancamento:String; pConexao:TSQLConnection);
var
   oQry1: TSQLQuery;
begin
(*
   glb_iError:=0;
   try
      try
         oQry1:=TSQLQuery.Create(Nil);
         oQry1.SQLConnection:=pConexao;
         with oQry1 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('select Razao_Social, Cnpj, '+QuotedStr('2015-05')+' as IniValid, '+QuotedStr('2099-12')+' as FimValid, ');
            SQL.Add(QuotedStr('99')+' as ClassTrib,');
            SQL.Add(QuotedStr('11.122.05/0001-68')+' as glb_1000SHCnpjSoftHouse,');
            SQL.Add(QuotedStr('GERA SYS TECNOINFO LTDA ME') +' as glb_1000SHNmRazao,');
            SQL.Add(QuotedStr('GERSON LUIS DA SILVA FARIAS')+' as glb_1000SHNmCont,');
            SQL.Add(QuotedStr('91-3729-5766')               +' as glb_1000SHTelefone,');
            SQL.Add(QuotedStr('gerasys.ti@hotmail.com')     +' as glb_1000SHemail,');
            SQL.Add(QuotedStr('0')                          +' as glb_1000IndSitPJ,');
            SQL.Add(QuotedStr('0')                          +' as glb_1000IndSitPF');


            SQL.Add('  from config_orgao');
            Open;

            glb_1000id                  :='01';
            glb_1000pAmb                :='1';
            glb_1000TpProcEmi           :='0';
            glb_1000glb_1000VerProc     :=glb_sVersao;
            glb_1000TpInsc              :=tpTpInsc(1);
            glb_1000NrInscr             :=Descriptografa(FieldByName('CNPJ').AsString);
            glb_1000ModoLancamento      :=TModoLancamento(pModoLancamento);
            glb_1000IniValid            :=Descriptografa(FieldByName('IniValid').AsString);
            glb_1000FimValid            :=Descriptografa(FieldByName('FimValid').AsString);
            glb_1000NmRazao             :=Descriptografa(FieldByName('Razao_Social').AsString);
            glb_1000ClassTrib           :=Descriptografa(FieldByName('ClassTrib').AsString);
            glb_1000NatJurid            :=FieldByName('Cod_Natureza_Juridica').AsString;
            glb_1000IndCoop             :=TpIndCoop(1);
            glb_1000IndConstr           :=TpIndConstr(1);
            glb_1000IndDesFolha         :=TpIndDesFolha(1);
            glb_1000IndOptRegEletron    :=TpIndOptRegEletron(1); {1 = Optou pelo registro eletrônico}
            glb_1000IndEtt              :=tpSimNao(2); {2 = Não é Empresa de Trabalho Temporário}
            glb_1000nmEnte              :=fncRetornaUF(tpuf(ufPA));
            glb_1000uf                  :=tpuf(ufPA);
            glb_1000vrSubteto           :=fncvrSubteto1000(glb_sAnoMesTrab, pConexao);// '100,00'; {Ver com um contador qual é o valor}
            glb_1000IdeMinLei           :=EmptyStr;
            glb_1000NrCertif            :=EmptyStr;
            glb_1000DtEmisCertif        :=EmptyStr;
            glb_1000DtVencCertif        :=EmptyStr;
            glb_1000NrProtRenov         :=EmptyStr;
            glb_1000DtProtRenov         :=EmptyStr;
            glb_1000DtDou               :=EmptyStr;
            glb_1000PagDou              :=EmptyStr;
            glb_1000NmCtt               :='NOME DO CONTADOR';
            glb_1000CpfCtt              :='123.456.789-01';
            glb_1000FoneFixo            :='91-9.9999-9999';
            glb_1000FoneCel             :='91-9.9999-9999';
            glb_1000Email               :='contador@email.com';
            glb_1000IndAcordoIsenMulta  :='1';
            glb_1000SHCnpjSoftHouse     :=FieldByName('glb_1000SHCnpjSoftHouse').AsString;
            glb_1000SHNmRazao           :=FieldByName('glb_1000SHNmRazao').AsString;
            glb_1000SHNmCont            :=FieldByName('glb_1000SHNmCont').AsString;
            glb_1000SHTelefone          :=FieldByName('glb_1000SHTelefone').AsString;
            glb_1000SHemail             :=FieldByName('glb_1000SHemail').AsString;
            glb_1000IndSitPJ            :=FieldByName('glb_1000IndSitPJ').AsString; //0=Situação normal
            glb_1000IndSitPF            :=FieldByName('glb_1000IndSitPF').AsString; //0=Situação normal
            glb_1000NovaIniValid        :='2018-01'; //Pegar a data do primeiro movimento a ser enviado
            glb_1000NovaFimValid        :=''
         end;
      except on E:EDataBaseError do
         begin
            mensagem('Erro ao consultar dados no banco...'+#13+
                     'Mensagem: '+E.Message, 'Error!', MB_OK+MB_ICONERROR);
         end;
      end;
   finally
      FreeAndNil(oQry1);
   end;
*)
end;


function fncRetornaUF(pUf:String):String;
var
   vRet:String;
begin
(*
   vRet:=EmptyStr;
   case pUf of
         'AC': vRet:='ACRE';
         'AL': vRet:='ALAGOAS';
         'AP': vRet:='AMAPÁ';
         'AM': vRet:='AMAZONAS';
         'BA': vRet:='BAHIA';
         'CE': vRet:='CEARA';
         'DF': vRet:='DISTRITO FEDERAL';
         'ES': vRet:='ESPÍRITO SANTO';
         'GO': vRet:='GOIÁS';
         'MA': vRet:='MARANHÃO';
         'MG': vRet:='MINAS GERAIS';
         'MT': vRet:='MATO GROSSO';
         'MS': vRet:='MATO GROSSO DO SUL';
         'PA': vRet:='PARÁ';
         'PB': vRet:='PARAÍBA';
         'PE': vRet:='PERNAMBUCO';
         'PI': vReT:='PIAUÍ';
         'PR': vRet:='PARANÁ';
         'RJ': vRet:='RIO DE JANEIRO';
         'RN': vRet:='RIO GRANDE DO NORTE';
         'RR': vRet:='RORÁIMA';
         'RS': vRet:='RIO GRANDE DO SUL';
         'RO': vReT:='RONDONIA';
         'SC': vRet:='SANTA CATARINA';
         'SP': vRet:='SÃO PAULO';
         'SE': vRet:='SERGIPE';
         'TO': vRet:='TOCANTINS';
   end;
   Result:=vRet;
*)
end;

end.

