Module: dylan-nbody-app

define variable *solar-system*
  = make(<body-system>);

add-body!(*solar-system*, make(<body>,
			       mass: 1.0d0));

add-body!(*solar-system*, make(<body>,
			       position: v3d (+4.84143144246472090e+00,
					      -1.16032004402742839e+00,
					      -1.03622044471123109e-01),
			       velocity: v3d (+1.66007664274403694e-03,
					      +7.69901118419740425e-03,
					      -6.90460016972063023e-05),
			       mass: 9.54791938424326609e-04));

add-body!(*solar-system*, make(<body>,
			       position: v3d (+8.34336671824457987e+00,
					      +4.12479856412430479e+00,
					      -4.03523417114321381e-01),
			       velocity: v3d (-2.76742510726862411e-03,
					      +4.99852801234917238e-03,
					      +2.30417297573763929e-05),
			       mass: 2.85885980666130812e-04));

add-body!(*solar-system*, make(<body>,
			       position: v3d (+1.28943695621391310e+01,
					      -1.51111514016986312e+01,
					      -2.23307578892655734e-01),
			       velocity: v3d (+2.96460137564761618e-03,
					      +2.37847173959480950e-03,
					      -2.96589568540237556e-05),
			       mass: 4.36624404335156298e-05));

add-body!(*solar-system*, make(<body>,
			       position: v3d (+1.53796971148509165e+01,
					      -2.59193146099879641e+01,
					      +1.79258772950371181e-01),
			       velocity: v3d (+2.68067772490389322e-03,
					      +1.62824170038242295e-03,
					      -9.51592254519715870e-05),
			       mass: 5.15138902046611451e-05));


define function main
    (name :: <string>, arguments :: <vector>)

  if (arguments.size > 0)
    let steps = string-to-integer(arguments[0], default: 0);
    if (steps > 1)
      *solar-system*.system-steps := steps
    end;
  end if;

  run!(*solar-system*);  
  exit-application(0);
end function;

main(application-name(), application-arguments());
