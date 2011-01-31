# Class: mcollective::plugins::registration::meta
#
#
class mcollective::plugins::registration::meta inherits mcollective::plugins::base {
	mcollective::plugin { "meta":
		ensure       => present,
		type         => "registration",
		source       => "puppet:///modules/mcollective/plugins/registration/meta.rb",
		config       => true,
		config_order => 15
	}
}
