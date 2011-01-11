# Class: mcollective::plugins::agent::package
#
#
class mcollective::plugins::agent::package inherits mcollective::plugins::base {
	mcollective::plugin { "package":
		ensure => present,
		type   => "agent",
		source => "puppet:///modules/mcollective/plugins/agent/package/puppet-package.rb",
		ddl    => true
	}
}
