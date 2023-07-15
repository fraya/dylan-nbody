Module: dylan-user

define library dylan-nbody-test-suite
  use common-dylan;
  use testworks;
  use v3d;
  use dylan-nbody;
end library;

define module dylan-nbody-test-suite
  use common-dylan;
  use testworks;
  use v3d;
  use dylan-nbody;
  use dylan-nbody-impl;
end module;
