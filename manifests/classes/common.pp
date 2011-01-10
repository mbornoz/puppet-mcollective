# Class: mcollective::common
# Common configuration class for mcollective and mcollective::client
#
class mcollective::common {
	$stomp_version = "1.1.6"
	include ruby::stomp
	
	File {
		ensure => directory,
		mode   => 0755,
		owner  => root,
		group  => root
	}
	
	package { mcollective-common:
		ensure  => latest,
		require => Class["ruby::stomp"]
	}
	
	file { "${mcollective::conf_dir}":
		ensure  => directory,
		require => Package[mcollective-common]
	}
	
	# ensure only files managed by puppet be present in this directory.
	file { "${mcollective::plugin_dir}/mcollective":
		ensure  => directory,
		require => Package[mcollective-common]
	}
	
	file { "${mcollective::agent_dir}":
		ensure  => directory,
		require => File["${mcollective::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::audit_dir}":
		ensure  => directory,
		require => File["${mcollective::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::connector_dir}":
		ensure  => directory,
		require => File["${mcollective::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::facts_dir}":
		ensure  => directory,
		require => File["${mcollective::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::registration_dir}":
		ensure  => directory,
		require => File["${mcollective::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::security_dir}":
		ensure  => directory,
		require => File["${mcollective::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::util_dir}":
		ensure  => directory,
		require => File["${mcollective::plugin_dir}/mcollective"]
	}
}