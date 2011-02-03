# Class: mcollective::plugins::registration::meta
#
#
class mcollective::plugins::registration::meta {
	mcollective::plugin { "meta":
		ensure       => present,
		type         => "registration",
		source       => "puppet:///modules/mcollective/plugins/puppetlabs/registration/meta.rb",
		config       => true,
		config_order => 15
	}
}
