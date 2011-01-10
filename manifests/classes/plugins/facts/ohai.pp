# Class: mcollective::plugins::facts::ohai
#
#
class mcollective::plugins::facts::ohai inherits mcollective::plugins::base {
	file { "${mcollective::facts_dir}/opscodeohai.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/facts/ohai/opscodeohai.rb",
		mode    => 644
	}
}