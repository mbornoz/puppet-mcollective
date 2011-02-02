# Class: mcollective::cli::util::ssh
#
#
class mcollective::cli::util::ssh inherits mcollective::cli::base {
	include ruby::highline
	
	mcollective::plugin::cli { "ssh":
		ensure => present,
		type   => util,
		source => "puppet:///modules/mcollective/plugins/puppetlabs/utilities/mc-ssh/mc-ssh-highline"
	}
}
