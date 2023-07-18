Module: dylan-user

define library dylan-nbody
  export
    dylan-nbody,
    dylan-nbody-impl;

  use common-dylan;
  use io,
    import: { format,
	      format-out,
	      print,
	      pprint };
  use v3d;
  
end library;

define module dylan-nbody

  create
    $solar-mass,
    $days-per-year;
  
  create
    <body>,
    <body-system>;

  create
    offset-momentum!;

  create
    body-position,
    body-position-setter,
    body-velocity,
    body-velocity-setter,
    body-mass,
    body-mass-setter;

  create
    advance!,
    energy,
    start!,
    report,
    run!;
  
end module;

define module dylan-nbody-impl
  use dylan-nbody;
  
  use common-dylan;
  use common-extensions,
    import: { string-to-integer };
  use format,
    import: { format };
  use format-out,
    import: { force-out,
	      format-out };
  use print;
  use pprint;
  use transcendentals;
  use v3d,
    rename: { distance => v3d/distance };
  
            

  // Additional exports for use by test suite.
  
  
end module;
