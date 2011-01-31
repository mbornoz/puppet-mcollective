# Class: mcollective::common
# Common configuration class for mcollective and mcollective::client
#
class mcollective::common {
	class { "ruby::stomp": version => $mcollective::params::stomp_version }
	
	File {
		ensure => directory,
		mode   => 0755,
		owner  => root,
		group  => root
	}
	
	package { "mcollective-common":
		ensure  => latest,
		require => Class["ruby::stomp"]
	}
	
	file { "${mcollective::params::conf_dir}":
		ensure  => directory,
		require => Package["mcollective-common"]
	}
	
	# ensure only files managed by puppet be present in this directory.
	file { "${mcollective::params::plugin_dir}/mcollective":
		ensure  => directory,
		require => Package["mcollective-common"]
	}
	
	file { "${mcollective::params::agent_dir}":
		ensure  => directory,
		require => File["${mcollective::params::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::params::audit_dir}":
		ensure  => directory,
		require => File["${mcollective::params::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::params::connector_dir}":
		ensure  => directory,
		require => File["${mcollective::params::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::params::facts_dir}":
		ensure  => directory,
		require => File["${mcollective::params::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::params::registration_dir}":
		ensure  => directory,
		require => File["${mcollective::params::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::params::security_dir}":
		ensure  => directory,
		require => File["${mcollective::params::plugin_dir}/mcollective"]
	}
	
	file { "${mcollective::params::util_dir}":
		ensure  => directory,
		require => File["${mcollective::params::plugin_dir}/mcollective"]
	}
}
