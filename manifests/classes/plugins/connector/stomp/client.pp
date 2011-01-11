# Class: mcollective::plugins::connector::stomp::client
#
#
class mcollective::plugins::connector::stomp::client inherits mcollective::plugins::connector::stomp {
	concat::fragment { "mcollective-client.cfg-connector-stomp":
		target  => "${mcollective::conf_dir}/client.cfg",
		order   => 15,
		content => template("mcollective/plugins/connector/stomp.cfg.erb")
	}
}
