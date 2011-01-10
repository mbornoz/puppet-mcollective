# Class: mcollective::plugins::audit
#
#
class mcollective::plugins::audit inherits mcollective::plugins::base {
	# TODO: Insert the following in server.cfg
	# rpcaudit = 1
	# rpcauditprovider = centralrpclog
	
	file { "${mcollective::audit_dir}/centralrpclog.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/audit/centralrpclog/audit/centralrpclog.rb",
		mode    => 644
	}
}