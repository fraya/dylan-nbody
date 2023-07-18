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

define method offset-momentum!
    (b :: <body>, p :: <v3>) => ()
  inc!(b.body-velocity, -p / $solar-mass)
end;

define inline function momentum
    (b :: <body>) => (momentum :: <v3>)
  b.body-velocity * b.body-mass
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

define function distance
    (b1 :: <body>, b2 :: <body>) => (distance :: <float>)
  v3d/distance(b1.body-position, b2.body-position)
end;

define function potential-energy
    (b1 :: <body>, b2 :: <body>) => (energy :: <double-float>)
  b1.body-mass * b2.body-mass / distance(b1, b2)
end;

define function position-after!
    (b :: <body>, dt :: <double-float>) => ()
  inc!(b.body-position, b.body-velocity * dt)
end;

define function velocity-after!
    (b1 :: <body>, b2 :: <body>, dt :: <double-float>)
 => ()
  let mag = dt / (distance(b1, b2) ^ 3);
  let d   = b1.body-position - b2.body-position;
  decrease-velocity!(b1, d, b2.body-mass * mag);
  increase-velocity!(b2, d, b1.body-mass * mag);
end;
