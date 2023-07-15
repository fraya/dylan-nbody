Module: dylan-nbody-impl

define constant <bodies>
  = limited(<stretchy-vector>, of: <body>);

define class <body-system> (<object>)
  slot system-bodies :: <bodies> = make(<bodies>),
    init-keyword: bodies:;
  slot system-delta :: <double-float> = 0.01d0,
    init-keyword: delta:;
  slot system-steps :: <integer> = 1,
    init-keyword: steps:;  
  slot system-step :: <integer> = 0,
    init-keyword: step:;
end;

define method print-object
    (system :: <body-system>, stream :: <stream>) => ()
  printing-object(system, stream)
    format(stream, "step: %d/%d delta: %=\n",
	   system.system-step,
	   system.system-steps,
	   system.system-delta);
    format(stream, "%=\n", system.system-bodies);
  end;
end;

define function add-body!
    (system :: <body-system>, body :: <body>) => ()
  add!(system.system-bodies, body)
end;

define function start!
    (system :: <body-system>) => ()
  offset-momentum!(system, $v3-zero)
end;

define function finished?
    (system :: <body-system>) => (finished? :: <boolean>)
  system.system-step >= system.system-steps
end;

define function report
    (system :: <body-system>) => ()
  format-out("%=\n", energy(system));
  force-out();
end;

define function run!
    (system :: <body-system>) => ()
  start!(system);
  report(system);
  until(finished?(system))
    advance!(system)
  end;
  report(system);
end;

define method offset-momentum!
    (system :: <body-system>, p :: <v3>) => ()
  
  for (b in system.system-bodies)
    inc!(p, b.body-velocity * b.body-mass);
  end;
  offset-momentum!(system.system-bodies[0], p);

end;

define function advance!
    (system :: <body-system>) => ()

  inc!(system.system-step);

  let bodies = system.system-bodies;
  let size   = bodies.size;
  
  for (i from 0 below size)
    for (j from i + 1 below size)
      velocity-after!(bodies[i], bodies[j], system.system-delta)
    end for;
  end for;

  for (body in bodies)
    position-after!(body, system.system-delta);
  end for;
end;

define function energy
    (system :: <body-system>) => (energy :: <double-float>)
  
  let bodies = system.system-bodies;
  let size   = bodies.size;
  let e      = 0.0d0;
  
  for (i from 0 below size)
    let bi = bodies[i];
    inc!(e, kinetic-energy(bi));
    for (j from i + 1 below size)
      dec!(e, potential-energy(bi, bodies[j]))
    end for;
  end for;
  e
end energy;
