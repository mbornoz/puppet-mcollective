# Class: mcollective::plugins::agent::filemgr
#
#
class mcollective::plugins::agent::filemgr {
	mcollective::plugin { "filemgr":
		ensure     => present,
		type       => "agent",
		source     => "puppet:///modules/mcollective/plugins/puppetlabs/agent/filemgr/agent/filemgr.rb",
		ddl        => true,
		ddl_source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/filemgr/agent/filemgr.ddl"
	}
}
