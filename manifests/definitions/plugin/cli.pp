# Define: mcollective::plugin::cli
# Parameters:
# arguments
#
define mcollective::plugin::cli ($ensure = present, $core = false, $type, $ddl = false, $repo = "puppetlabs",
								 $source = "", $target = "", $ddl_source = "", $ddl_target = "") {	
	if ( $source == "" ) {
		case $repo {
			"puppetlabs": {
				$real_source = "puppet:///modules/mcollective/plugins/puppetlabs/${type}/${name}/mc-${name}"
			}
			"ripienaar": {
				$real_source = "puppet:///modules/mcollective/plugins/ripienaar/${type}/${name}/mc-${name}"
			}
			"mstanislav": {
				$real_source = "puppet:///modules/mcollective/plugins/mstanislav/${name}/mc-${name}"
			}
			"rottenbytes": {
				$real_source = "puppet:///modules/mcollective/plugins/rottenbytes/clients/mc-${name}"
			}
			"jofu": {
				$real_source = "puppet:///modules/mcollective/plugins/jofu/mc-${name}"
			}
			"joemiller": {
				$real_source = "puppet:///modules/mcollective/plugins/joemiller/mc-${name}"
			}
			default: {
				fail("Unknown mcollective plugins repo ${repo} in module 'mcollective'")
			}
		}
	} else {
		$real_source = $source
	}
	
	if ( $target == "" ) { 
		$real_target = "/usr/sbin/mc-${name}"
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
	
	case $type {
		/(?i)(agent|connector|facts|registration|security|util)/: {
			case $ensure {
				present: {
					if ( ! $core) {
						file { $real_target:
							ensure  => present,
							source  => $real_source,
							mode    => 755,
							require => Class["mcollective::common"]
						}
					}
					
					if $ddl {
						mcollective::plugin::ddl { "cli-$name":
							ensure => present,
							source => $ddl_real_source,
							target => $ddl_real_target,
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
