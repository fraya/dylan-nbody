Module: dylan-nbody-test-suite

define test test-constructor ()
  let one = v3d(1.0d0, 1.0d0, 1.0d0);
  let sun = make(<body>, velocity: one, mass: 1.0d0);
  let vel = one * $days-per-year;
  assert-equal($v3-zero, sun.body-position);
  assert-equal(vel, sun.body-velocity);
  assert-equal($solar-mass, sun.body-mass);
end test;


// Use `_build/bin/dylan-nbody-test-suite --help` to see options.
run-test-application()
