Module: dylan-nbody-app

define constant $version = "0.1.0";

define command-line <nbody-command-line> ()
  option steps :: <integer>,
    names: #("steps"),
    help: "Number of steps of the algorithm",
    kind: <parameter-option>,
    default: 1;
  option version :: <boolean>,
    names: #("version"),
    help: "Shows version number",
    kind: <flag-option>,
    default: #f;
end command-line;

define function main
    (name :: <string>, arguments :: <vector>)
  block ()
    let cmd = make(<nbody-command-line>, help: "nbody problem");
    parse-command-line(cmd, arguments);

    if (cmd.version)
      format-out("v%s\n", $version);
      exit-application(0);
    end;
      
    if (cmd.steps < 1)
      format-err("Steps parameter must be greater than 0\n");
      exit-application(1);
    end;

    let solar-system = make-solar-system();
    let delta = 0.01d0;
    run!(solar-system, cmd.steps, delta);
    exit-application(0);
  exception (err :: <abort-command-error>)
    format-err("Usage error: %s\n", err);
    exit-application(err.exit-status);
  end;
end function;

main(application-name(), application-arguments());
