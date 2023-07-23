Module: dylan-nbody-test-suite

define test test-constructor ()
  let one = v3d(1.0d0, 1.0d0, 1.0d0);
  let sun = make(<body>, velocity: one, mass: 1.0d0);
  let vel = one * $days-per-year;
  assert-equal($v3-zero, sun.body-position);
  assert-equal(vel, sun.body-velocity);
  assert-equal($solar-mass, sun.body-mass);
end test;

define test test-run-system-one-time ()
  let system = make-solar-system();
  let delta  = 0.01d0;
  start!(system);
  assert-true(similar(-0.1690752d0, energy(system)));
  advance!(system, delta);
  assert-true(similar(-0.1690749d0, energy(system)));
end test;

define benchmark n-body-problem ()
  let system = make-solar-system();
  let steps  = 1_000_000;
  let delta  = 0.01d0;
  start!(system);
  for (i :: <integer> from 0 below steps)
    advance!(system, delta);
  end;
  assert-true(similar(-0.1690862d0, energy(system)));
end benchmark;


// Use `_build/bin/dylan-nbody-test-suite --help` to see options.
run-test-application()
