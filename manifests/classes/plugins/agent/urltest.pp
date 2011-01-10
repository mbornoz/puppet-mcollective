# Class: mcollective::plugins::agent::urltest
#
#
class mcollective::plugins::agent::urltest inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/urltest.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/urltest/urltest.rb",
		mode    => 644,
		require => File[$urltest_dir]
	}
	
	file { "${mcollective::agent_dir}/urltest.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/urltest/urltest.ddl",
		mode    => 644,
		require => File[$urltest_dir]
	}
}