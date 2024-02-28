unit IPinpadBase;

interface

uses Classes, Windows, SysUtils;

type
  TPinpadBase = class(TObject)
  public
    function TryPurchase(Amount: Double): integer; virtual;
    function Return(Amount: Double): integer; virtual;
    function CommitTrx: integer; virtual;
    function RollbackTrx: integer; virtual;
    function SuspendTrx: integer; virtual;
    function TestPinPad: boolean; virtual;
    function GetStatistics: integer; virtual;
    function CloseDay: integer; virtual;
    function ReadTrack2: string; virtual;
    function ServiceMenu: integer; virtual;
  end;

implementation

{ TPinpadBase }

function TPinpadBase.CloseDay: integer;
begin

end;

function TPinpadBase.CommitTrx: integer;
begin

end;

function TPinpadBase.GetStatistics: integer;
begin

end;

function TPinpadBase.ReadTrack2: string;
begin

end;

function TPinpadBase.Return(Amount: Double): integer;
begin

end;

function TPinpadBase.RollbackTrx: integer;
begin

end;

function TPinpadBase.ServiceMenu: integer;
begin

end;

function TPinpadBase.SuspendTrx: integer;
begin

end;

function TPinpadBase.TestPinPad: boolean;
begin

end;

function TPinpadBase.TryPurchase(Amount: Double): integer;
begin

end;

end.
