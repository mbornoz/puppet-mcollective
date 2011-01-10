# Class: mcollective::plugins::agent::puppetral
#
#
class mcollective::plugins::agent::puppetral inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/puppetral.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/puppetral/puppetral.rb",
		mode    => 644
	}
}