# The baseline for module testing used by Puppet Inc. is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# https://docs.puppet.com/guides/tests_smoke.html
#

$snd_test_file = '/tmp/I_sure_do_hope_you_dont_have_a_file_named_like_this'

$search_items = { 
  $snd_test_file => {
    search_str   => '^then_im_sorry$',
    display_only =>  false,
  }
}

file { $snd_test_file:
  ensure  => file,
  content => "well_if_you_do
then_im_sorry
that_its_overwritten
",
}

class { 'snd':
  search_items => $search_items, 
}

# Alternatively you can setup data in hiera and include the class
#include ::snd

