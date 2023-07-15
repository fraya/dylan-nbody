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
