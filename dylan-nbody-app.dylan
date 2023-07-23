Module: dylan-nbody-app

define function main
    (name :: <string>, arguments :: <vector>)

  if (arguments.size < 1)
    format-err("Usage: %s <number-of-steps>\n", name);
    exit-application(1);
  end if;
  
  let steps = string-to-integer(arguments[0], default: 1000);
  let delta = 0.01d0;

  let solar-system = make-solar-system();
  run!(solar-system, steps, delta);
  exit-application(0);
end function;

main(application-name(), application-arguments());
