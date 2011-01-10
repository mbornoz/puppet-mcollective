# Class: mcollective::plugins::registration::meta
#
#
class mcollective::plugins::registration::meta inherits mcollective::plugins::base {
	if ( ! $mcollective_registerinterval )  { $mcollective_registerinterval = "300" }
	
	file { "${mcollective::registration_dir}/meta.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/registration/meta.rb",
		mode    => 644
	}
	
	concat::fragment { "mcollective-server.cfg-registration-meta":
		target  => "${mcollective::conf_dir}/server.cfg",
		order   => 15,
		content => template("mcollective/plugins/registration/meta.cfg.erb")
	}
}