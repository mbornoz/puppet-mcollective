# Class: mcollective::cli::agent::filemgr
#
#
class mcollective::cli::agent::filemgr {
	mcollective::plugin::cli { "filemgr":
		ensure     => present,
		type       => agent,
		source     => "puppet:///modules/mcollective/plugins/puppetlabs/agent/filemgr/sbin/mc-filemgr",
		ddl        => true,
		ddl_source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/filemgr/agent/filemgr.ddl"
	}
}
