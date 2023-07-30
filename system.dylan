Module: dylan-nbody-impl

define constant <body-system>
  = limited(<stretchy-vector>, of: <body>);

define method offset-momentum!
    (system :: <body-system>, p :: <v3>) => ()
  for (b in system) inc!(p, momentum(b)) end;
  offset-momentum!(system[0], p);
end;

define function advance!
    (system :: <body-system>, delta :: <double-float>) => ()
  let size = system.size;  
  for (i from 0 below size)
    for (j from i + 1 below size)
      velocity-after!(system[i], system[j], delta)
    end for;
  end for;

  for (body in system)
    position-after!(body, delta);
  end for;
end;

define function energy
    (system :: <body-system>) => (energy :: <double-float>)
  let size   = system.size;
  let energy = 0.0d0;
  
  for (i from 0 below size)
    inc!(energy, kinetic-energy(system[i]));
    for (j from i + 1 below size)
      dec!(energy, potential-energy(system[i], system[j]))
    end for;
  end for;
  energy
end energy;
