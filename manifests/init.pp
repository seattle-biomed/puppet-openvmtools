# == Class: openvmtools
#
# Puppet module to install and configure openvmtools on a VMware VM.
#
# === Parameters
#
# === Examples
#
#  include openvmtools
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2012 Andrew Leonard, Seattle Biomedical Research Institute
#
class openvmtools {

  case $lsbdistid {
    'Ubuntu': {
      case $lsbdistrelease {
        '12.04': {
          if $virtual == 'vmware' {
            package { 'open-vm-tools': ensure => present }
          }
        }
        default: {
          fail("Module ${module_name} is not supported on Ubuntu ${lsbdistrelease}.")
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${lsbdistid}.")
    }
  }

}
