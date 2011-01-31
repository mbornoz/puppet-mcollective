# Class: mcollective::plugins::connector::stomp::node
#
#
class mcollective::plugins::connector::stomp::node inherits mcollective::plugins::base {
	concat::fragment { "mcollective-server.cfg-connector-stomp":
		target  => "${mcollective::params::conf_dir}/server.cfg",
		order   => 15,
		content => template("mcollective/plugins/connector/stomp.cfg.erb")
	}
}
