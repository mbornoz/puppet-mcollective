# Class: mcollective::plugins::agent::filemgr
#
#
class mcollective::plugins::agent::filemgr inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/filemgr.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/filemgr/filemgr.rb",
		mode    => 644
	}
	
	file { "${mcollective::agent_dir}/filemgr.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/filemgr/filemgr.ddl",
		mode    => 644
	}
}
