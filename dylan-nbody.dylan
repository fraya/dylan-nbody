Module: dylan-nbody-impl

define macro inc!
  { inc! (?place:expression, ?dx:expression) }
    => { ?place := ?place + ?dx; }
  { inc! (?place:expression) }
    => { ?place := ?place + 1; }
end macro inc!;

define macro dec!
  { dec! (?place:expression, ?dx:expression) }
    => { ?place := ?place - ?dx; }
  { dec! (?place:expression) }
    => { ?place := ?place - 1; }
end macro dec!;

define constant $solar-mass
  = 4 * $double-pi * $double-pi;

define constant $days-per-year
  = 365.24d0;

define generic offset-momentum!
  (object :: <object>, p :: <v3>) => ();

define function make-sun
    () => (sun :: <body>)
   make(<body>, mass: 1.0d0)
end;

define function make-jupiter
    () => (jupiter :: <body>)
  make(<body>,
       position: v3(+4.84143144246472090e+00,
		    -1.16032004402742839e+00,
		    -1.03622044471123109e-01),
       velocity: v3(+1.66007664274403694e-03,
		    +7.69901118419740425e-03,
		    -6.90460016972063023e-05),
       mass: +9.54791938424326609e-04)
end;

define function make-saturn
    () => (saturn :: <body>)
  make(<body>,
       position: v3(+8.34336671824457987e+00,
		    +4.12479856412430479e+00,
		    -4.03523417114321381e-01),
       velocity: v3(-2.76742510726862411e-03,
		    +4.99852801234917238e-03,
		    +2.30417297573763929e-05),
       mass: +2.85885980666130812e-04)
end;

define function make-uranus
    () => (uranus :: <body>)
  make(<body>,
       position: v3(+1.28943695621391310e+01,
		    -1.51111514016986312e+01,
		    -2.23307578892655734e-01),
       velocity: v3(+2.96460137564761618e-03,
		    +2.37847173959480950e-03,
		    -2.96589568540237556e-05),
       mass: +4.36624404335156298e-05)
end;

define function make-neptune
    () => (neptune :: <body>)
  make(<body>,
       position: v3(+1.53796971148509165e+01,
		    -2.59193146099879641e+01,
		    +1.79258772950371181e-01),
       velocity: v3(+2.68067772490389322e-03,
		    +1.62824170038242295e-03,
		    -9.51592254519715870e-05),
       mass: +5.15138902046611451e-05)
end;

define function make-solar-system
    () => (system :: <body-system>)
  let system = make(<body-system>);
  add!(system, make-sun());
  add!(system, make-jupiter());
  add!(system, make-saturn());
  add!(system, make-uranus());
  add!(system, make-neptune());
  system
end;
