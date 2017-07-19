# Class: snd
# ===========================
#
# Full description of class snd here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'snd':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# steroidg(at)gmail(dot)com
#
# Copyright
# ---------
#
# Copyright 2017 steroidg.
#
# An example class.
#
# This is an example of how to document a Puppet class
#
# @summary Module to search a string within a file. If found, either display summary a message, or remove it.
#
# @example Declaring the class
#   include snd
#
# @param search_items List of search items
class snd (
  Hash $search_items = $snd::params::search_items
)  inherits snd::params {
  create_resources(snd::search_and_destroy, $search_items)
}
