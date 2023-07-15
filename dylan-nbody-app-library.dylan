Module: dylan-user
Synopsis: Module and library definition for executable application

define library dylan-nbody-app
  use common-dylan;
  use dylan-nbody;
  use io;
  use v3d;
end library;

define module dylan-nbody-app
  use common-dylan;
  use format;
  use format-out;
  use print;
  use pprint;
  use transcendentals;
  use v3d;
  
  use dylan-nbody;
end module;
