unit principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.ListBox, FMX.Objects,
  FMX.Effects, FMX.Filter.Effects, FMX.Ani;

type
  Tform_principal = class(TForm)
    pnl_topo: TRectangle;
    Text6: TText;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Text7: TText;
    lista_nao_terminal: TListBox;
    layout_nao_terminal: TLayout;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    GlowEffect1: TGlowEffect;
    Layout1: TLayout;
    btn_nao_terminal: TRectangle;
    BitmapAnimation1: TBitmapAnimation;
    FillRGBEffect1: TFillRGBEffect;
    cp_nao_terminal: TEdit;
    Layout3: TLayout;
    Rectangle4: TRectangle;
    FillRGBEffect2: TFillRGBEffect;
    GlowEffect2: TGlowEffect;
    layout_terminal: TLayout;
    Rectangle7: TRectangle;
    Text1: TText;
    Layout5: TLayout;
    Rectangle8: TRectangle;
    FillRGBEffect3: TFillRGBEffect;
    Rectangle9: TRectangle;
    lista_terminal: TListBox;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Layout6: TLayout;
    btn_terminal: TRectangle;
    anim_btn_terminal: TBitmapAnimation;
    cor_btn_terminal: TFillRGBEffect;
    cp_terminal: TEdit;
    GlowEffect3: TGlowEffect;
    GlowEffect4: TGlowEffect;
    layout_producoes: TLayout;
    Rectangle12: TRectangle;
    Text2: TText;
    Layout8: TLayout;
    Rectangle13: TRectangle;
    FillRGBEffect4: TFillRGBEffect;
    Rectangle14: TRectangle;
    lista_producoes: TListBox;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Layout9: TLayout;
    btn_producao: TRectangle;
    anim_producoes: TBitmapAnimation;
    co_btn_producoes: TFillRGBEffect;
    cp_producoes: TEdit;
    GlowEffect5: TGlowEffect;
    GlowEffect6: TGlowEffect;
    btn_gerar: TRectangle;
    Text3: TText;
    ColorAnimation1: TColorAnimation;
    GlowEffect7: TGlowEffect;
    layout_status: TLayout;
    Rectangle18: TRectangle;
    lbl_status: TText;
    anim_status: TFloatAnimation;
    timer_status: TTimer;
    layout_geral: TLayout;
    Rectangle19: TRectangle;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Rectangle17: TRectangle;
    FillRGBEffect5: TFillRGBEffect;
    anim_brilho_nao_terminal: TFloatAnimation;
    Rectangle20: TRectangle;
    FillRGBEffect6: TFillRGBEffect;
    Layout4: TLayout;
    Rectangle21: TRectangle;
    memo_first: TListBox;
    Rectangle22: TRectangle;
    FillRGBEffect7: TFillRGBEffect;
    FloatAnimation1: TFloatAnimation;
    GlowEffect9: TGlowEffect;
    Rectangle26: TRectangle;
    Text8: TText;
    Layout10: TLayout;
    Rectangle27: TRectangle;
    FillRGBEffect9: TFillRGBEffect;
    Layout7: TLayout;
    Rectangle23: TRectangle;
    memo_follow: TListBox;
    Rectangle24: TRectangle;
    FillRGBEffect8: TFillRGBEffect;
    FloatAnimation2: TFloatAnimation;
    GlowEffect8: TGlowEffect;
    Rectangle25: TRectangle;
    Text4: TText;
    Layout11: TLayout;
    Layout12: TLayout;
    Rectangle28: TRectangle;
    FillRGBEffect10: TFillRGBEffect;
    Rectangle29: TRectangle;
    FillRGBEffect11: TFillRGBEffect;


    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    procedure Button4Click(Sender: TObject);
    

    procedure lista_nao_terminalItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure BitmapAnimation1Process(Sender: TObject);
    procedure cp_nao_terminalEnter(Sender: TObject);
    procedure btn_nao_terminalClick(Sender: TObject);
    procedure lista_terminalItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure anim_btn_terminalProcess(Sender: TObject);
    procedure cp_terminalEnter(Sender: TObject);
    procedure btn_terminalClick(Sender: TObject);
    procedure btn_producaoClick(Sender: TObject);
    procedure lista_producoesItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure cp_producoesEnter(Sender: TObject);
    procedure btn_gerarClick(Sender: TObject);
    procedure timer_statusTimer(Sender: TObject);
    procedure Rectangle29Click(Sender: TObject);
  private
    function retorna_first(Nao_Terminal: String): String;
    function Verifica_Existencia(Lista:TStrings; No: string): Boolean;
    function Elimina_Duplicidade_De_Nos(Lista: String): String;
    procedure Exibe_Mensagem(msg: String);
    procedure Inserir_Producao(Nao_Terminal, Producao: String);
    { Private declarations }
  public
    { Public declarations }
  end;

const

  ARQ_NAO_TERMINAL = 'nao_terminais.lex';
  ARQ_TERMINAL = 'terminais.lex';
  ARQ_PRODUCOES = 'producoes.lex';


var
  form_principal: Tform_principal;

implementation

{$R *.fmx}

procedure Tform_principal.anim_btn_terminalProcess(Sender: TObject);
begin
  cor_btn_terminal.UpdateParentEffects;
end;

procedure Tform_principal.BitmapAnimation1Process(Sender: TObject);
begin
FillRGBEffect1.UpdateParentEffects;
end;

procedure Tform_principal.btn_nao_terminalClick(Sender: TObject);
begin
  if btn_nao_terminal.Tag = 0 then
  begin
   if Verifica_Existencia(lista_nao_terminal.Items,AnsiUpperCase(cp_nao_terminal.Text)) then exit;

   lista_nao_terminal.Items.Add(AnsiUpperCase(cp_nao_terminal.Text));
   cp_nao_terminal.Text := '';
   cp_nao_terminal.SetFocus;
  end else
  begin
    lista_nao_terminal.Items.Delete(lista_nao_terminal.ItemIndex);
  end;
end;

{*******************************************************************************
Procedimento : Inserir_Produca
Parâmetros : Nao_Terminal,Producao : String;

Recebe um Nó não terminal e atribui à ele uma nova produção
*******************************************************************************}

procedure Tform_principal.Inserir_Producao(Nao_Terminal:String;Producao:String);
var
  stl : TStringList;
  I,J: Integer;
  p : String;
  sucesso : Boolean;
  Encontrou_Nao_Terminal : Boolean;
begin
  stl := TStringList.Create;
  try
    stl.Delimiter := '>';

    Encontrou_Nao_Terminal := False;
    sucesso := True;

      for I := 0 to lista_producoes.Count - 1 do
      begin


        stl.DelimitedText := lista_producoes.Items.Strings[I];

        if stl.Strings[0] = Nao_Terminal then
        begin
          Encontrou_Nao_Terminal := True;
          p := stl.Strings[1];
          stl.Delimiter := '|';
          stl.DelimitedText := p;

          for J := 0 to stl.Count - 1 do
          begin
            if Producao = stl.Strings[J] then
            begin
              sucesso := False;
            end;
          end;

          if sucesso then
          begin
            p := p + '|' + producao;
            lista_producoes.Items.Strings[I] := Nao_Terminal + '>'+p;
          end;

          break;
        end;
      end;
    if not Encontrou_Nao_Terminal then
    begin
      lista_Producoes.Items.Add(Nao_Terminal + '>' +Producao);
    end;
  finally
    stl.Free;
  end;
end;

procedure Tform_principal.btn_producaoClick(Sender: TObject);
begin
  if pos('>',cp_producoes.Text) > 0 then
  begin

    Exibe_Mensagem('Utilize o seguinte padrão: Ex: Ba|a|d');

    exit;
  end;



  if btn_producao.Tag = 0 then
  begin

   try

   Inserir_Producao(lista_nao_terminal.Items[lista_nao_terminal.ItemIndex],cp_producoes.Text);

   cp_producoes.Text := '';
   cp_producoes.SetFocus;
   except
    on Exception do
    begin
      anim_brilho_nao_terminal.Start;
      Exibe_Mensagem('Selecione um nó Não Terminal!');
    end;
   end;
  end else
    lista_producoes.Items.Delete(lista_producoes.ItemIndex);

end;

procedure Tform_principal.btn_terminalClick(Sender: TObject);
begin
  if btn_terminal.Tag = 0 then
  begin
   if Verifica_Existencia(lista_terminal.Items,AnsiLowerCase(cp_terminal.Text)) then exit;

   lista_terminal.Items.Add(AnsiLowerCase(cp_terminal.Text));
   cp_terminal.Text := '';
   cp_terminal.SetFocus;
  end else
  begin
    lista_terminal.Items.Delete(lista_terminal.ItemIndex);
  end;
end;




function Tform_principal.Verifica_Existencia(Lista:TStrings;No:string):Boolean;
var
  stl : TStringList;
begin

  Result :=  (Lista.IndexOf(No) > 0);

end;

function Tform_principal.Elimina_Duplicidade_De_Nos(Lista:String):String;
var
  stl : TStringList;
  I,J: Integer;
begin
  stl := TStringList.Create;
  try
    stl.Delimiter := ',';
    stl.DelimitedText := Lista;
    for I := stl.Count - 1 downto 0 do
    begin
      for J := 0 to stl.Count - 1 do
        try
        if (stl.Strings[I] = stl.Strings[J]) and (I<>J) then
          stl.Delete(I)
        except

        end;
    end;
    Result := stl.DelimitedText;
  finally
    stl.Free;
  end;

end;

function Tform_principal.retorna_first(Nao_Terminal:String):String;
var
  I,J,K,l : integer;
  firsts : string;
  no_nao_terminal : String;
  no_terminal : String;
  producao : TStringList;
  aux : string;
  yy  : boolean;
begin
  producao := TStringList.Create;
  try
    producao.Delimiter := '>';

    for J := 0 to lista_producoes.Count - 1 do
    begin
      producao.DelimitedText := lista_producoes.Items.Strings[J];
      if producao.Strings[0] = Nao_Terminal then
      begin
        firsts := producao.Strings[1];
        producao.Delimiter := '|';
        producao.DelimitedText := firsts;
        aux := '';
        for k := 0 to producao.Count - 1 do
        begin
          //procura por nós terminais
          yy := false;
          for l := 0 to lista_terminal.Items.Count - 1 do
          begin
            if copy(producao.Strings[k],1,1) = lista_terminal.Items.Strings[l] then
            begin
              yy := True;
              if aux = EmptyStr then
                aux := lista_terminal.Items.Strings[l]
              else
                aux := aux + ',' + lista_terminal.Items.Strings[l];
              break;
            end;
          end;

          if not yy then
          begin
            for l := 0 to lista_nao_terminal.Items.Count - 1 do
            begin
              if copy(producao.Strings[k],1,1) = lista_nao_terminal.Items.Strings[l] then
              begin
                if aux = EmptyStr then
                  aux := retorna_first(lista_nao_terminal.Items.Strings[l])
                else
                  aux := aux + ',' + retorna_first(lista_nao_terminal.Items.Strings[l]);
                break;
              end;
            end;
          end;



        end;



      end;
      if aux <> EmptyStr then
        break;
    end;
    finally
      producao.Free;
    end;
  Result := Elimina_Duplicidade_De_Nos(aux);
end;

procedure Tform_principal.timer_statusTimer(Sender: TObject);
begin
  timer_status.Enabled := False;
  anim_status.Inverse := True;
  anim_status.Start;
end;

procedure Tform_principal.Exibe_Mensagem(msg:String);
begin
  lbl_status.Text := msg;
  timer_status.Enabled := True;
  anim_status.Inverse := False;
  anim_status.Start;
end;

procedure Tform_principal.Button4Click(Sender: TObject);
var
  I,J,K,l : integer;

  firsts : string;
  no_nao_terminal : String;
  no_terminal : String;
  producao : TStringList;
  aux : string;
begin
  try
    for I := 0 to lista_nao_terminal.Count - 1 do
    begin
      aux := retorna_first(lista_nao_terminal.Items.Strings[I]);
      memo_first.Items.Add('First('+lista_nao_terminal.Items[I]+')={'+aux+'}');
    end;

    for I := 0 to lista_nao_terminal.Count - 1 do
    begin
      memo_follow.Items.Add('Follow('+lista_nao_terminal.Items[I]+')={à implementar}');
    end;
  except
    on E:Exception do
      Exibe_Mensagem('Erro ao atualizar!');

  end;

end;

procedure Tform_principal.cp_nao_terminalEnter(Sender: TObject);
begin
  if btn_nao_terminal.Tag = 1 then
  begin
    BitmapAnimation1.Inverse := True;
    BitmapAnimation1.Start;
    btn_nao_terminal.Tag := 0;
  end;
end;


procedure Tform_principal.cp_producoesEnter(Sender: TObject);
begin
  if btn_producao.Tag = 1 then
  begin
    anim_producoes.Inverse := True;
    anim_producoes.Start;
    btn_producao.Tag := 0;
  end;

end;

procedure Tform_principal.cp_terminalEnter(Sender: TObject);
begin
    if btn_terminal.Tag = 1 then
  begin
    anim_btn_terminal.Inverse := True;
    anim_btn_terminal.Start;
    btn_terminal.Tag := 0;
  end;
end;



procedure Tform_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lista_nao_terminal.Items.SaveToFile(ExtractFilePath(ParamStr(0))+ARQ_NAO_TERMINAL);
  lista_terminal.Items.SaveToFile(ExtractFilePath(ParamStr(0))+ARQ_TERMINAL);
  lista_producoes.Items.SaveToFile(ExtractFilePath(ParamStr(0))+ARQ_PRODUCOES);
end;

procedure Tform_principal.FormShow(Sender: TObject);
begin
  if FileExists(ExtractFilePath(ParamStr(0))+ARQ_NAO_TERMINAL) then
    lista_nao_terminal.Items.LoadFromFile(ExtractFilePath(ParamStr(0))+ARQ_NAO_TERMINAL);
  if FileExists(ExtractFilePath(ParamStr(0))+ARQ_TERMINAL) then
    lista_terminal.Items.LoadFromFile(ExtractFilePath(ParamStr(0))+ARQ_TERMINAL);
  if FileExists(ExtractFilePath(ParamStr(0))+ARQ_PRODUCOES) then
    lista_producoes.Items.LoadFromFile(ExtractFilePath(ParamStr(0))+ARQ_PRODUCOES);
end;

procedure Tform_principal.lista_nao_terminalItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  if btn_nao_terminal.Tag = 0 then
  begin
    BitmapAnimation1.Inverse := False;
    BitmapAnimation1.Start;
    btn_nao_terminal.Tag := 1;
  end;


end;





procedure Tform_principal.lista_producoesItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  if btn_producao.Tag = 0 then
  begin
    anim_producoes.Inverse := False;
    anim_producoes.Start;
    btn_producao.Tag := 1;
  end;

end;

procedure Tform_principal.lista_terminalItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  if btn_terminal.Tag = 0 then
  begin
    anim_btn_terminal.Inverse := False;
    anim_btn_terminal.Start;
    btn_terminal.Tag := 1;
  end;

end;



procedure Tform_principal.Rectangle29Click(Sender: TObject);
begin
  close;
end;

procedure Tform_principal.btn_gerarClick(Sender: TObject);
var
  I,J,K,l : integer;

  firsts : string;
  no_nao_terminal : String;
  no_terminal : String;
  producao : TStringList;
  aux : string;
begin
  try

    memo_first.Items.Clear;
    for I := 0 to lista_nao_terminal.Count - 1 do
    begin
      aux := retorna_first(lista_nao_terminal.Items.Strings[I]);

      memo_first.Items.Add('First('+lista_nao_terminal.Items[I]+')={'+aux+'}');
    end;

    memo_follow.Items.Clear;
    for I := 0 to lista_nao_terminal.Count - 1 do
    begin
      memo_follow.Items.Add('Follow('+lista_nao_terminal.Items[I]+')={à implementar}');
    end;
  except
    on E:Exception do
      Exibe_Mensagem('Existe algum erro nas suas produções!');

  end;

end;

end.
