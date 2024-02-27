//****************************************************************************//
//                              © Guard 1998-2013                             //
//****************************************************************************//
unit ExcelObj;

interface

uses Forms, SysUtils, ComObj, Variants, Db, {Excel_Const}Excel_TLB, Grids, DBGrids;

var
  Excel,ExSelRegion: Variant;
  ExlActive: Boolean = False;

    procedure ExlCreate;
    procedure ExlDestroy;
    procedure ExlSetTableBorder(const XTop,YTop,XBottom,YBottom: Integer;
              LnStyle: Integer = xlContinuous; LnWeight: Integer = xlThick);
    procedure ExlSetInsideBorder(const XTop,YTop,XBottom,YBottom: Integer;
              LnStyle: Integer = xlContinuous; LnWeight: Integer = xlThin);
    procedure ExlInsertTable(ColDef,RowDef: Integer; ClientTable: TDataSet; SetFieldsName: Boolean = True; SetBorder: Boolean = True);overload;
    procedure ExlInsertTable(ColDef,RowDef: Integer; ClientTable: TDBGrid; SetFieldsName: Boolean = True; SetBorder: Boolean = True);overload;
    procedure ExlCelFormat(const SetRange: String; FmtStr: String = '# ##0,000');
    function ExlGetCell(const X,Y: Integer): String;
    function ExlGetRange(const X1,Y1,X2,Y2: Integer): String;

implementation

uses
  Dialogs;

procedure ExlCreate;
begin
    if not(Vartype(Excel) = VarDispatch)then
    begin
      Excel:= CreateOleObject('Excel.Application');
      ExlActive:= True;
    end;
end;

procedure ExlDestroy;
begin
     if Vartype(Excel) = VarDispatch then
     begin
      Excel.Quit;
      Excel:= UnAssigned;
      ExlActive:= False;
     end;
end;

function ExlGetCell(const X,Y: Integer): String;
begin
     ExlGetCell:= Format('%s%d',[xlRowName[X],Y]);
end;

function ExlGetRange(const X1,Y1,X2,Y2: Integer): String;
begin
    if X1 > 26 then Result:= 'A' + xlRowName[X1-26] + IntToStr(Y1)
    else Result:= xlRowName[X1] + IntToStr(Y1);
    if X2 > 26 then Result:= Result + ':A' + xlRowName[X2-26] + IntToStr(Y2)
    else Result:= Result + ':' + xlRowName[X2] + IntToStr(Y2);
end;

procedure ExlCelFormat(const SetRange: String; FmtStr: String = '# ##0,000');
begin
     Excel.ActiveSheet.Range[SetRange].NumberFormat:= FmtStr;
end;

procedure ExlSetTableBorder(const XTop,YTop,XBottom,YBottom: Integer;
          LnStyle: Integer = xlContinuous; LnWeight: Integer = xlThick);
var i: Integer;
begin
      for i:= xlEdgeLeft to xlEdgeRight do
      begin
        Excel.ActiveSheet.Range[ExlGetRange(XTop,YTop,XBottom,YBottom)].Borders[i].LineStyle:= LnStyle;
        Excel.ActiveSheet.Range[ExlGetRange(XTop,YTop,XBottom,YBottom)].Borders[i].Weight:= LnWeight;
      end;
      ExlSetInsideBorder(XTop,YTop,XBottom,YBottom);
end;

procedure ExlSetInsideBorder(const XTop,YTop,XBottom,YBottom: Integer;
          LnStyle:Integer = xlContinuous;LnWeight:Integer = xlThin);
begin
   if XTop <> XBottom then
   begin
     Excel.ActiveSheet.Range[ExlGetRange(XTop,YTop,XBottom,YBottom)].Borders[xlInsideVertical].LineStyle:= LnStyle;
     Excel.ActiveSheet.Range[ExlGetRange(XTop,YTop,XBottom,YBottom)].Borders[xlInsideVertical].Weight:= LnWeight;
   end;
   if YTop <> YBottom then
   begin
     Excel.ActiveSheet.Range[ExlGetRange(XTop,YTop,XBottom,YBottom)].Borders[xlInsideHorizontal].LineStyle:= LnStyle;
     Excel.ActiveSheet.Range[ExlGetRange(XTop,YTop,XBottom,YBottom)].Borders[xlInsideHorizontal].Weight:= LnWeight;
   end;
end;

procedure ExlInsertTable(ColDef,RowDef: Integer; ClientTable: TDataSet; SetFieldsName: Boolean = True; SetBorder: Boolean = True);
var Sheet,v : Variant;
    Col,Row,i: Integer;
 begin
   try
     Sheet:= Excel.ActiveSheet;
     Sheet.Cells.VerticalAlignment := xlCenter;
     with ClientTable do
     try
       DisableControls;
       Row:= RowDef;
       Col:= ColDef;
      if SetFieldsName then
       for i:= 0 to FieldCount - 1 do
         if Fields[i].Visible then
         begin
           Sheet.Cells[Row,Col]:= Fields[i].DisplayName;
           if SetBorder then
           begin
             Sheet.Cells[Row,Col].Interior.ColorIndex:= 15;
             Sheet.Cells[Row,Col].Interior.Pattern:= xlSolid;
           end;
           Inc(Col);
         end;
       Sheet.Rows[Row].Font.Bold:= True;
       Inc(Row);
       First;
       while not EOF do
       begin
         Col:= ColDef;
         for i:= 0 to FieldCount - 1 do
           if Fields[i].Visible then
           begin
             v:= Fields[i].Value;

             case ClientTable.Fields[i].DataType of
              ftString: Sheet.Cells[Row,Col].NumberFormat:= '@';
              ftFloat: Sheet.Cells[Row,Col].NumberFormat:= '# ##0,00#';
              ftCurrency: Sheet.Cells[Row,Col].NumberFormat:= '# ##0,00$';
             end;

             Sheet.Cells[Row,Col]:= v;
             Inc(Col);
           end;
         Application.ProcessMessages;
         Next;
         Inc(Row);
       end;
       if SetBorder then
       begin
         ExlSetTableBorder(ColDef,RowDef,Col - 1,Row - 1);
         ExlSetTableBorder(ColDef,RowDef + 1,Col - 1,Row - 1);
       end;
     finally
       EnableControls;
     end;
   finally
     Sheet.Cells.Columns.AutoFit;
   end;
 end;

procedure ExlInsertTable(ColDef,RowDef: Integer; ClientTable: TDBGrid; SetFieldsName: Boolean = True; SetBorder: Boolean = True);
var Sheet,v : Variant;
    Col,Row,i: Integer;
 begin
   try
     Sheet:= Excel.ActiveSheet;
     Sheet.Cells.VerticalAlignment := xlCenter;
     with ClientTable.DataSource.DataSet do
     try
       DisableControls;
       Row:= RowDef;
       Col:= ColDef;
      if SetFieldsName then
       for i:= 0 to ClientTable.Columns.Count - 1 do
         if ClientTable.Columns[i].Visible then
         begin
           Sheet.Cells[Row,Col]:= ClientTable.Columns[i].Title.Caption;
           Sheet.Cells[Row,Col].HorizontalAlignment:= xlCenter;
           Sheet.Cells[Row,Col].WrapText:= True;
           if SetBorder then
           begin
             Sheet.Cells[Row,Col].Interior.ColorIndex:= 15;
             Sheet.Cells[Row,Col].Interior.Pattern:= xlSolid;
           end;
           Inc(Col);
         end;
       Sheet.Rows[Row].Font.Bold:= True;
       Inc(Row);
       First;
       while not EOF do
       begin
         Col:= ColDef;
         for i:= 0 to ClientTable.Columns.Count - 1 do
           if ClientTable.Columns[i].Visible then
           begin
             v:= ClientTable.Columns[i].Field.Value;

             case ClientTable.Columns[i].Field.DataType of
              ftString: Sheet.Cells[Row,Col].NumberFormat:= '@';
              ftFloat: Sheet.Cells[Row,Col].NumberFormat:= '# ##0,00#';
              ftCurrency: Sheet.Cells[Row,Col].NumberFormat:= '# ##0,00$';
             end;

             Sheet.Cells[Row,Col]:= v;
             Inc(Col);
           end;
         Application.ProcessMessages;
         Next;
         Inc(Row);
       end;
       if SetBorder then
       begin
         ExlSetTableBorder(ColDef,RowDef,Col - 1,Row - 1);
         ExlSetTableBorder(ColDef,RowDef + 1,Col - 1,Row - 1);
       end;
     finally
       EnableControls;
     end;
   finally
     Sheet.Cells.Columns.AutoFit;
   end;
 end;

end.
