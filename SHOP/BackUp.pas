unit BackUp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IB_Services, Vcl.Buttons,
  Vcl.ExtCtrls, IdFTPCommon, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, idGlobal;

type
  TBackUpForm = class(TForm)
    pFIBBackupService1: TpFIBBackupService;
    Panel1: TPanel;
    Memo1: TMemo;
    Timer1: TTimer;
    IdFTP1: TIdFTP;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BackUpForm: TBackUpForm;
  BackUpOK: Boolean;

implementation

{$R *.dfm}

uses ShopMain;

procedure TBackUpForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 // CanClose:= BackUpOK;
end;

procedure TBackUpForm.FormCreate(Sender: TObject);
begin
  BackUpOK:= False;
  pFIBBackupService1.LibraryName:= ShopMainForm.pFIBDatabase1.LibraryName;
end;

procedure TBackUpForm.Timer1Timer(Sender: TObject);
var BackName: String;
    BackUpLog: Boolean;
    searchResult: TSearchRec;
begin
     Timer1.Enabled:= False;
     if ShopIni.ReadBool('BackUp', 'BackUp', False)then
     begin
       Screen.Cursor:= crHourGlass;
       BackUpLog:= ShopIni.ReadBool('BackUp', 'BackUpLog', False);
       if BackUpLog then DelExists(ExtractFilePath(ParamStr(0)) + 'backup.log');
       BackUpForm.Memo1.Lines.Clear;
       with pFIBBackupService1 do
       begin
          Params.Clear;
          LoginPrompt:= False;
          Params.Add('user_name=SYSDBA');
          Params.Add('password=masterkey');

          DatabaseName:= ShopMainForm.pFIBDatabase1.DBFileName;
          if ShopMainForm.pFIBDatabase1.IsRemoteConnect then
          begin
            Protocol:= TCP;
            ServerName:= ShopMainForm.pFIBDatabase1.DBSiteName;

            BackName:= ShopMainForm.pFIBDatabase1.DBFileName;
            Delete(BackName, Pos(':', BackName), 1);
            BackName:= '//' + ShopMainForm.pFIBDatabase1.DBSiteName + '/' + BackName;
          end
          else
          begin
            Protocol:= Local;
            ServerName:= '';
            BackName:= pFIBBackupService1.DatabaseName;
          end;
          BackName[Length(BackName)-1]:= 'B';
          BackName[Length(BackName)]:= 'K';

          Active:= True;
          try
            Verbose:= True;
            Options:= [IgnoreLimbo, NoGarbageCollection];
            BackupFile.Clear;
            BackupFile.Add(ExtractFilePath(ParamStr(0)) + 'shop.fbk');
            ServiceStart;
            while not Eof do
              begin
                BackUpForm.Memo1.Lines.Add(GetNextLine);
                if BackUpLog then SaveToLog(BackUpForm.Memo1.Lines[
                   BackUpForm.Memo1.Lines.Count-1], 'backup.log');
                Application.ProcessMessages;
              end;
          finally
            Active:= False;
          end;
        end;


 {      with ShopMainForm.VCLZip1 do
       begin
       // Упаковка базы
         FilesList.Clear;
         FilesList.Add(ExtractFilePath(ParamStr(0)) + 'shop.fbk');
         FilesList.Add(ExtractFilePath(ParamStr(0)) + 'shop.err');
         FilesList.Add(ExtractFilePath(ParamStr(0)) + 'shop.ini');
         FilesList.Add(ExtractFilePath(ParamStr(0)) + 'kkm_log.err');
         FilesList.Add(ExtractFilePath(ParamStr(0)) + 'shop.log');
         ZipName:= ShopIni.ReadString('BackUp', 'BackUpPath', ExtractFilePath(ParamStr(0))+ 'BackUp\')
                 + 'b' + FormatDateTime('yymmdd', Now) + '.zip';
         DestDir:= '';
         Zip;
       end;
  }

       with ShopMainForm.ZipForge1 do
       begin // Архивация резервного файла
         BackUpForm.Memo1.Lines.Add('');
         BackUpForm.Memo1.Lines.Add('Архивация резервного файла');
         BackUpForm.Memo1.Lines.Add(ExtractFilePath(ParamStr(0)) + 'shop.fbk');
         if BackUpLog then
         begin
           SaveToLog('Архивация резервного файла', 'backup.log');
           SaveToLog(ExtractFilePath(ParamStr(0)) + 'shop.fbk', 'backup.log');
         end;
         Application.ProcessMessages;
         BaseDir:= ShopIni.ReadString('BackUp', 'BackUpPath', ExtractFilePath(ParamStr(0)) + 'BackUp\');
         FileName:= BaseDir + 'b' + FormatDateTime('yymmdd', Now) + '.zip';
         OpenArchive(fmCreate);

         AddFiles(ExtractFilePath(ParamStr(0)) + 'shop.fbk');
         AddFiles(ExtractFilePath(ParamStr(0)) + 'shop.err');
         AddFiles(ExtractFilePath(ParamStr(0)) + 'shop.ini');
         AddFiles(ExtractFilePath(ParamStr(0)) + 'kkm_log.err');
         AddFiles(ExtractFilePath(ParamStr(0)) + 'shop.log');
         CloseArchive();
       end;

       if ShopIni.ReadBool('BackUp', 'FTP_Send', False) then
         with IdFTP1 do
         begin   // Загрузка резервной копии на FTP
           Username:= ShopIni.ReadString('BackUp', 'FTP_UserName', 'tehkom-ftp');
           Password:= ShopIni.ReadString('BackUp', 'FTP_Password', 'loh2ooCaepaidojo');
           Host:= ShopIni.ReadString('BackUp', 'FTP_Host', '89.253.255.94');
           Passive:= True;
           DefStringEncoding:= enUTF8;
           TransferType:= ftBinary;
           Connect;
           try
            ChangeDir(ShopIni.ReadString('BackUp', 'FTP_SendDir', '/files/backup/' + CurrentMarketCode.ToString + '/'));
            BackUpForm.Memo1.Lines.Add('');
            BackUpForm.Memo1.Lines.Add('Передача на FTP');
            Put(ShopMainForm.ZipForge1.FileName, ExtractFileName(ShopMainForm.ZipForge1.FileName), False);

            SetCurrentDir(ExtractFilePath(ShopMainForm.ZipForge1.FileName));
            if FindFirst('b*.zip', faAnyFile, searchResult) = 0 then
            begin // Находим в директории BackUp копии старше 7 дней и удаляем
              repeat
                if FileDateToDateTime(searchResult.time) <= (date - ShopIni.ReadInteger('BackUp', 'StorageDays', 7)) then
                begin
                  DeleteFile(searchResult.name);   // Удаляем с локального диска
                  IdFTP1.Delete(searchResult.name); // Удаляем с FTP
                end;
              until FindNext(searchResult) <> 0;
              FindClose(searchResult);
            end;

           finally
            Disconnect;
           end;
         end
         else
         begin
           SetCurrentDir(ExtractFilePath(ShopMainForm.ZipForge1.FileName));
           if FindFirst('b*.zip', faAnyFile, searchResult) = 0 then
           begin // Находим в директории BackUp копии старше 7 дней и удаляем
             repeat
               if FileDateToDateTime(searchResult.time) <= (date - ShopIni.ReadInteger('BackUp', 'StorageDays', 7)) then
               begin
                 DeleteFile(searchResult.name);   // Удаляем с локального диска
               end;
             until FindNext(searchResult) <> 0;
             FindClose(searchResult);
           end;
         end;



       ShopIni.WriteDateTime('BackUp', 'LastBackUpDate', Now);
       SaveToLog('Резервное копирование', 'shop.log');

       DelExists(BackName);
       Screen.Cursor:= crDefault;
       BackUpOK:= True;
       BackUpForm.Close;
     end;
 end;

end.
