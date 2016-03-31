# == Class: paasta
#
# Installs the paasta-tools package and writes Paasta system configuration.
#
# === Parameters:
#
# [*ensure*]
#   The version of paasta-tools to install. Defaults to latest.
#
# [*config_dir*]
#   Where to write out system paasta configuration. Defaults to /etc/paasta.
#
class paasta(
  $ensure = 'latest',
  $config_dir = '/etc/paasta',
) {

  file { $config_dir:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    recurse => true,
    purge   => true
  }

  package { 'paasta-tools':
    ensure => $ensure,
  }
}