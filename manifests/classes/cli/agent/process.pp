# Class: mcollective::cli::agent::process
#
#
class mcollective::cli::agent::process {
	mcollective::plugin::cli { "process":
		ensure => present,
		type   => agent,
		source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/process/mc-pgrep",
		target => "/usr/sbin/mc-pgrep",
		ddl    => true
	}
}
