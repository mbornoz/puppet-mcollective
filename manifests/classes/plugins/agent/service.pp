# Class: mcollective::plugins::agent::service
#
#
class mcollective::plugins::agent::service inherits mcollective::plugins::base {
	mcollective::plugin { "service":
		ensure => present,
		type   => "agent",
		source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/service/puppet-service.rb",
		ddl    => true
	}
}
