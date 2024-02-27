unit EditPosDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TEditDocPosFrm = class(TForm)
    AddSprBtn: TBitBtn;
    NameEdit: TEdit;
    PosVendPriceEdit: TEdit;
    PosPriceEdit: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    PosKolvoEdit: TEdit;
    PosItemEdit: TEdit;
    procedure PosItemEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PosKolvoEditChange(Sender: TObject);
    procedure PosKolvoEditKeyPress(Sender: TObject; var Key: Char);
    procedure AddSprBtnClick(Sender: TObject);
    procedure PosVendPriceEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditDocPosFrm: TEditDocPosFrm;
  Market_Code, GroupCode: Integer;

implementation

uses ShopMain, Spr, MoveTovar;

{$R *.dfm}

procedure TEditDocPosFrm.PosItemEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if(Key = VK_RETURN)and(PosItemEdit.Text <> '')then
        begin
          ShopMainForm.pFIBFindTovarStoredProc.ParamByName('FIND_ITEM').AsString:= PosItemEdit.Text;
          ShopMainForm.pFIBFindTovarStoredProc.ExecProc;
          if ShopMainForm.pFIBFindTovarStoredProc.ParamByName('RESULT').AsInteger = 0 then
          begin
            MessageDlg('Данный товар не зарегистрирован', mtInformation, [mbOK], 0);
            PosItemEdit.SelectAll;
          end
          else
          begin
            NameEdit.Text:= ShopMainForm.pFIBFindTovarStoredProc.ParamByName('NAME').AsString;
            PosPriceEdit.Text:= FloatToStrF(ShopMainForm.pFIBFindTovarStoredProc.ParamByName('PRICE').AsCurrency, ffFixed, 15, 2);
            PosVendPriceEdit.Text:= FloatToStrF(ShopMainForm.pFIBFindTovarStoredProc.ParamByName('V_PRICE').AsCurrency, ffFixed, 15, 2);
            GroupCode:= ShopMainForm.pFIBFindTovarStoredProc.ParamByName('T_GROUP').AsInteger;
            PosKolvoEdit.Enabled:= True;
            PosKolvoEdit.Text:= '1';
            PosKolvoEdit.SetFocus;
            PosPriceEdit.Enabled:= True;
            PosVendPriceEdit.Enabled:= True;
            PosItemEdit.Enabled:= False;
            AddSprBtn.Enabled:= False;
          end;
        end;
        if (Key = VK_INSERT)and(Sender = PosItemEdit)then AddSprBtn.Click;
end;

procedure TEditDocPosFrm.PosKolvoEditChange(Sender: TObject);
begin
     if EditDocPosFrm.Visible then
        BitBtn4.Enabled:= (StrToFloat('0' + PosKolvoEdit.Text) > 0)and(StrToFloat('0'+PosPriceEdit.Text) > 0);
end;

procedure TEditDocPosFrm.PosKolvoEditKeyPress(Sender: TObject;
  var Key: Char);
begin
        if not(Key in [#8, '0'..'9', ','])then Key:= #0;
        if(Pos(',', (Sender as TEdit).Text) > 0)then
        begin
          if(Key = ',')then Key:= #0
          else if Key <> #8 then
            if((Sender as TEdit).SelStart >= Pos(',', (Sender as TEdit).Text))and
              (Length((Sender as TEdit).Text) - Pos(',', (Sender as TEdit).Text) >= 3)
            then Key:= #0;
        end;
end;

procedure TEditDocPosFrm.PosVendPriceEditKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in[#8,',','0'..'9'])then Key:= #0;
     if(Pos(',', (Sender as TEdit).Text) > 0)then
     begin
       if(Key = ',')then Key:= #0
       else if Key <> #8 then
         if((Sender as TEdit).SelStart >= Pos(',', (Sender as TEdit).Text))and
           (Length((Sender as TEdit).Text) - Pos(',', (Sender as TEdit).Text) >= 2)
         then Key:= #0;
     end;
end;

procedure TEditDocPosFrm.AddSprBtnClick(Sender: TObject);
var i: Integer;
begin
       if not VarIsNull(MoveTovarFrm.HdrTable['KOD'])then i:= MoveTovarFrm.HdrTable['KOD']
       else i:= -1;
       PosItemEdit.Text:= ChangeWithCat;
       MoveTovarFrm.HdrTable.Active:= True;
       MoveTovarFrm.HdrTable.Locate('KOD', i, []);
       MoveTovarFrm.PosTable.Active:= True;
       PosItemEdit.SetFocus;
       PosItemEdit.SelectAll;
end;

end.
