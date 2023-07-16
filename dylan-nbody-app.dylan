Module: dylan-nbody-app

define variable *solar-system*
  = make(<body-system>);

add-body!(*solar-system*, make(<body>, mass: 1.0d0));

add-body!(*solar-system*,
	  body(px: +4.84143144246472090e+00,
	       py: -1.16032004402742839e+00,
	       pz: -1.03622044471123109e-01,
	       vx: +1.66007664274403694e-03,
	       vy: +7.69901118419740425e-03,
	       vz: -6.90460016972063023e-05,
	       m:  +9.54791938424326609e-04));

add-body!(*solar-system*,
	  body(px: +8.34336671824457987e+00,
	       py: +4.12479856412430479e+00,
	       pz: -4.03523417114321381e-01,
	       vx: -2.76742510726862411e-03,
	       vy: +4.99852801234917238e-03,
	       vz: +2.30417297573763929e-05,
	       m:  +2.85885980666130812e-04));

add-body!(*solar-system*,
	  body(px: +1.28943695621391310e+01,
	       py: -1.51111514016986312e+01,
	       pz: -2.23307578892655734e-01,
	       vx: +2.96460137564761618e-03,
	       vy: +2.37847173959480950e-03,
	       vz: -2.96589568540237556e-05,
	       m:  +4.36624404335156298e-05));

add-body!(*solar-system*,
	  body(px: +1.53796971148509165e+01,
	       py: -2.59193146099879641e+01,
	       pz: +1.79258772950371181e-01,
	       vx: +2.68067772490389322e-03,
	       vy: +1.62824170038242295e-03,
	       vz: -9.51592254519715870e-05,
	       m:  +5.15138902046611451e-05));

define function main
    (name :: <string>, arguments :: <vector>)
  if (arguments.size > 0)
    run!(*solar-system*, steps: string-to-integer(arguments[0]));
  else
    run!(*solar-system*)
  end if;

  exit-application(0);
end function;

main(application-name(), application-arguments());
