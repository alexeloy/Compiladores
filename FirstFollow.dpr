program FirstFollow;

uses
  System.StartUpCopy,
  FMX.Forms,
  principal in 'principal.pas' {form_principal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tform_principal, form_principal);
  Application.Run;
end.
