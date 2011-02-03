# Class: mcollective::plugins::audit
#
#
class mcollective::plugins::audit {
	# TODO: Insert the following to server.cfg
	# plugin.centralrpclog.logfile = /var/log/mcollective-rpcaudit.log
	# Setup log rotation for logfile
	
	file { "${mcollective::agent_dir}/centralrpclog.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/audit/centralrpclog/agent/centralrpclog.rb",
		mode    => 644,
		require => File[$audit_audit_dir]
	}
}