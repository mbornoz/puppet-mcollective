# Class: mcollective::plugins::connector::stomp
#
#
class mcollective::plugins::connector::stomp inherits mcollective::plugins::base {
	if ( ! $mcollective_stomp_host )     { $mcollective_stomp_host = "localhost" }
	if ( ! $mcollective_stomp_port )     { $mcollective_stomp_port = "6163" }
	if ( ! $mcollective_stomp_user )     { $mcollective_stomp_user = "guest" }
	if ( ! $mcollective_stomp_password ) { $mcollective_stomp_password = "guest" }
	
	concat::fragment { "mcollective-server.cfg-connector-stomp":
		target  => "${mcollective::conf_dir}/server.cfg",
		order   => 15,
		content => template("mcollective/plugins/connector/stomp.cfg.erb")
	}
}
