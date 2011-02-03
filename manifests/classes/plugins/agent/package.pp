# Class: mcollective::plugins::agent::package
#
#
class mcollective::plugins::agent::package {
	mcollective::plugin { "package":
		ensure => present,
		type   => "agent",
		source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/package/puppet-package.rb",
		ddl    => true
	}
}
