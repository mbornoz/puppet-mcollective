# Class: mcollective::plugins::process
#
#
class mcollective::plugins::agent::process inherits mcollective::plugins::base {
	include ruby::sys_proctable
	
	file { "${mcollective::agent_dir}/process.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/process/process.rb",
		mode    => 644
	}
}
