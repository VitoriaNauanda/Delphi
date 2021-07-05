program Calendario;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {Form4},
  unitValidarCampos in 'unitValidarCampos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
