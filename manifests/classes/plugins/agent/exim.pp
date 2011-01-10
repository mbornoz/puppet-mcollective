# Class: mcollective::plugin::exim
#
#
class mcollective::plugins::agent::exim inherits mcollective::plugins::base {
	
	file { "${mcollective::agent_dir}/exim.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/exim/exim.rb",
		mode    => 644
	}
	
	# TODO: these probably don't belong here
	file { "${mcollective::util_dir}/eximclient.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/exim/util/eximclient.rb",
		mode    => 644
	}
	
	file { "${mcollective::util_dir}/eximserver.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/exim/util/eximserver.rb",
		mode    => 644
	}
}