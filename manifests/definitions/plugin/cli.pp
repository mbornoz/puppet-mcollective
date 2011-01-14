# Define: mcollective::plugin::cli
# Parameters:
# arguments
#
define mcollective::plugin::cli ($ensure = present, $core = false, $type, $ddl = false,
								 $source = "", $target = "", $ddl_source = "", $ddl_target = "") {	
	if ( $source == "" ) { 
		$real_source = "puppet:///modules/mcollective/plugins/${type}/${name}/mc-${name}"
	} else {
		$real_source = $source
	}
	
	if ( $target == "" ) { 
		$real_target = "/usr/sbin/mc-${name}"
	} else {
		$real_target = $target
	}
	
	if ( $ddl_source == "" ) { 
		$ddl_real_source = "puppet:///modules/mcollective/plugins/${type}/${name}/${name}.ddl"
	} else {
		$ddl_real_source = $ddl_source
	}
	
	if ( $ddl_target == "" ) { 
		$ddl_real_target = "${mcollective::plugin_dir}/mcollective/${type}/${name}.ddl"
	} else {
		$ddl_real_target = $ddl_target
	}
	
	case $type {
		/(?i)(agent|connector|facts|registration|security|util)/: {
			case $ensure {
				present: {
					if ( ! $core) {
						file { $real_target:
							ensure => present,
							source => $real_source,
							mode   => 755
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
