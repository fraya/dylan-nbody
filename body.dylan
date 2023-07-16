Module: dylan-nbody-impl

define class <body> (<object>)
  slot body-position :: <v3> = $v3-zero,
    init-keyword: position:;
  slot body-velocity :: <v3> = $v3-zero,
    init-keyword: velocity:;
  slot body-mass :: <double-float>,
    required-init-keyword: mass:;
end class <body>;

define method initialize
    (body :: <body>, #key, #all-keys) => ()
  next-method();
  body.body-velocity := body.body-velocity * $days-per-year;
  body.body-mass     := body.body-mass * $solar-mass;
end;

define method print-object
    (body :: <body>, stream :: <stream>) => ()
  printing-object(body, stream)
    format(stream, "p: %=, v: %=, m: %=",
	   body.body-position,
	   body.body-velocity,
	   body.body-mass)
  end;
end;

define function body
    (#key px, py, pz, vx, vy, vz, m) => (body :: <body>)
  make(<body>,
       position: v3d(px, py, pz),
       velocity: v3d(vx, vy, vz),
       mass: m)
end;

define method offset-momentum!
    (b :: <body>, p :: <v3>) => ()
  b.body-velocity := -p / $solar-mass
end;

define function increase-velocity!
    (b :: <body>, d :: <v3>, m :: <double-float>) => ()
  inc!(b.body-velocity, d * m)
end;

define function decrease-velocity!
    (b :: <body>, d :: <v3>, m :: <double-float>) => ()
  dec!(b.body-velocity, d * m)
end;

define function kinetic-energy
    (body :: <body>) => (energy :: <double-float>)
  0.5 * body.body-mass * squared(body.body-velocity)
end;

define function potential-energy
    (b1 :: <body>, b2 :: <body>) => (energy :: <double-float>)
  let distance = distance(b1.body-position, b2.body-position);
  b1.body-mass * b2.body-mass / distance
end;

define function position-after!
    (b :: <body>, dt :: <double-float>) => ()
  inc!(b.body-position, b.body-velocity * dt)
end;

define inline function velocity-after!
    (b1 :: <body>, b2 :: <body>, dt :: <double-float>)
 => ()
  let p1  = b1.body-position;
  let p2  = b2.body-position;
  let d   = p1 - p2;
  let distance = distance(p1, p2);
  let mag = dt / (distance * distance * distance);

  decrease-velocity!(b1, d, b2.body-mass * mag);
  increase-velocity!(b2, d, b1.body-mass * mag);
end;

