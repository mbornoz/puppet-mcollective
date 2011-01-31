# Define: mcollective::plugin
# Parameters:
# arguments
#
define mcollective::plugin ($ensure = present, $core = false, $type, $ddl = false, $config = false, 
							$source = "", $target = "", $ddl_source = "", $ddl_target = "",
							$config_source = "", $config_target = "${mcollective::params::conf_dir}/server.cfg", $config_order = 99) {
	if ( $source == "" ) { 
		$real_source = "puppet:///modules/mcollective/plugins/${type}/${name}/${name}.rb"
	} else {
		$real_source = $source
	}
	
	if ( $target == "" ) { 
		$real_target = "${mcollective::params::plugin_dir}/mcollective/${type}/${name}.rb"
	} else {
		$real_target = $target
	}
	
	if ( $ddl_source == "" ) { 
		$ddl_real_source = "puppet:///modules/mcollective/plugins/${type}/${name}/${name}.ddl"
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
							ensure => present,
							source => $real_source,
							mode   => 644,
							owner  => root,
							group  => root
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
