Module: dylan-user

define library dylan-nbody
  use common-dylan;
  use io,
    import: { format,
	      format-out,
	      print,
	      pprint };
  use v3d;

  export
    dylan-nbody,
    dylan-nbody-impl;
end library;

define module dylan-nbody

  create
    $solar-mass,
    $days-per-year;
  
  create
    <body>,
    <bodies>,
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
    system-bodies, system-bodies-setter,
    system-delta, system-delta-setter,
    system-steps, system-steps-setter,
    system-step,  system-step-setter; 

  create
    add-body!,
    advance!,
    energy,
    start!,
    finished?,
    report,
    run!;
  
end module;

define module dylan-nbody-impl
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
  use v3d;
  
  use dylan-nbody;                 

  // Additional exports for use by test suite.
  
  
end module;
