# == Define paasta::config_file
#
# Deploys a config file in /etc/paasta/ in json format for Paasta to read
#
# === Parameters
#
# [*title*]
#   Name of the resource, used to construct a filename. Something like "logs"
#
# [*path*]
#   Actual location on disk the file ends up going to. Defaults to
#   ${::paasta::config_dir}/${title}.json
#
# [*config*]
#   A hash of the input options, ends up as serialized json.
#
# [*mode*]
#   Unix permissions of the file, defaults to 444. Can be modified if the
#   config file contains secrets.
#
# [*replace*]
#   Whether puppet should replace the file if it already exists. Useful if
#   some other process will write the file contents, and you want Puppet to
#   leave it alone.
#
define paasta::config_file (
  $path = "${::paasta::config_dir}/${title}.json",
  $config = {},
  $mode = '0444',
  $replace = true,
) {

  file { $path:
    owner     => 'root',
    group     => 'root',
    mode      => $mode,
    content   => inline_template("<%= require 'json'; JSON.pretty_generate(@config) %>"),
    show_diff => false,
    replace   => $replace,
  }
}