# Define: mcollective::plugin
# Parameters:
# arguments
#
define mcollective::plugin ($ensure = present, $core = false, $type, $ddl = false, $config = false, $repo = "puppetlabs",
							$source = "", $target = "", $ddl_source = "", $ddl_target = "",
							$config_source = "", $config_target = "${mcollective::params::conf_dir}/server.cfg", $config_order = 99) {
	if ( $source == "" ) {
		case $repo {
			"puppetlabs": {
				$real_source = "puppet:///modules/mcollective/plugins/puppetlabs/${type}/${name}/${name}.rb"
			}
			"ripienaar": {
				$real_source = "puppet:///modules/mcollective/plugins/ripienaar/${type}/${name}/${name}.rb"
			}
			"mstanislav": {
				$real_source = "puppet:///modules/mcollective/plugins/mstanislav/${name}/${name}.rb"
			}
			"rottenbytes": {
				$real_source = "puppet:///modules/mcollective/plugins/rottenbytes/plugins/agents/${name}.rb"
			}
			"jofu": {
				$real_source = "puppet:///modules/mcollective/plugins/jofu/${name}.rb"
			}
			"jofu": {
				$real_source = "puppet:///modules/mcollective/plugins/joemiller/${name}.rb"
			}
			default: {
				fail("Unknown mcollective plugins repo ${repo} in module 'mcollective'")
			}
		}
	} else {
		$real_source = $source
	}
	
	if ( $target == "" ) { 
		$real_target = "${mcollective::params::plugin_dir}/mcollective/${type}/${name}.rb"
	} else {
		$real_target = $target
	}
	
	if ( $ddl_source == "" ) { 
		case $repo {
			"puppetlabs": {
				$ddl_real_source = "puppet:///modules/mcollective/plugins/puppetlabs/${type}/${name}/${name}.ddl"
			}
			"ripienaar": {
				$ddl_real_source = "puppet:///modules/mcollective/plugins/ripienaar/${type}/${name}/${name}.ddl"
			}
			"mstanislav": {
				$ddl_real_source = "puppet:///modules/mcollective/plugins/mstanislav/${name}/${name}.ddl"
			}
			"rottenbytes": {
				$ddl_real_source = "puppet:///modules/mcollective/plugins/rottenbytes/plugins/agents/${name}.ddl"
			}
			"jofu": {
				$ddl_real_source = "puppet:///modules/mcollective/plugins/jofu/${name}.ddl"
			}
			"joemiller": {
				$ddl_real_source = "puppet:///modules/mcollective/plugins/joemiller/${name}.ddl"
			}
			default: {
				fail("Unknown mcollective plugins repo ${repo} in module 'mcollective'")
			}
		}
	} else {
		$ddl_real_source = $ddl_source
	}
	
	if ( $ddl_target == "" ) { 
		$ddl_real_target = "${mcollective::params::plugin_dir}/mcollective/${type}/${name}.ddl"
	} else {
		$ddl_real_target = $ddl_target
	}
	
	if ( $config and $config_source == "" ) { 
		$config_real_source = template("mcollective/plugins/${type}/${name}.cfg.erb")
	} else {
		$config_real_source = $config_source
	}
	
	case $type {
		/(?i)(agent|connector|facts|registration|security|util)/: {
			case $ensure {
				present: {
					if ( ! $core) {
						file { $real_target:
							ensure  => present,
							source  => $real_source,
							mode    => 644,
							owner   => root,
							group   => root,
							require => Class["mcollective::common"]
						}
					}
					
					if $ddl {
						mcollective::plugin::ddl { "plugin-$name":
							ensure => present,
							source => $ddl_real_source,
							target => $ddl_real_target
						}
					}
					
					if $config {
						concat::fragment { "${config_target}-${type}-${name}":
							target  => $config_target,
							order   => $config_order,
							content => $config_real_source
						}
					}
				}
				absent: {
					if ( ! $core) {
						file { $real_target:
							ensure => absent
						}
					}
					
					if $ddl {
						file { $ddl_real_target:
							ensure => absent
						}
					}
				}
			}
		}
		default: { notice("${hostname}: unsupported mcollective plugin type ${type}") }	
	}
}
