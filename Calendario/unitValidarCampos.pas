unit unitValidarCampos;

interface
  uses
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
    Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

    procedure pcrValidarCamposObrigatorios(Form4 : TForm);



implementation

uses
System.SysUtils;


procedure pcrValidarCamposObrigatorios(Form4 : TForm);
Var
  i: Integer;


begin

//for i := 0 to Form4.ComponentCount -1 do
//  begin

//    if Form4.Components[i].Tag = 2 then
//      begin

//          if((Form4.Components[i] as TDBEdit).Text = '') and ((Form4.Components[i] as TDBEdit).Hint <> '') then
//            begin
//              ShowMessage('O campo '+(Form4.Components[i] as TDBEdit).Hint+' n�o foi preenchido ');
//              Abort;
//            end;
//      end;
//  end;

end;
end.

  //       if ((Form4.Components[i] as TDBComboBox).Text = '') and ((Form4.Components[i] as TDBComboBox).Hint <> '') then

  //        begin

   //          ShowMessage('O campo '+(Form4.Components[i] as TDBComboBox).Hint+' n�o foi preenchido ');
   //         Abort;
    //      end;
















