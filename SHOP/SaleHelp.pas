unit SaleHelp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls;

type
  TSaleHelpFrm = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaleHelpFrm: TSaleHelpFrm;

implementation

{$R *.dfm}

procedure TSaleHelpFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key = VK_ESCAPE then Close;
end;

end.
