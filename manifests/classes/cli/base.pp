# Class: mcollective::cli::base inherits mcollective
#
#
class mcollective::cli::base inherits mcollective {
	Mcollective::Plugin::Cli {
		require => Class["mcollective::common"]
	}
}
