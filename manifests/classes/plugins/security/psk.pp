# Class: mcollective::plugins::security::psk
#
#
class mcollective::plugins::security::psk inherits mcollective::plugins::base {
	if ( ! $mcollective_psk_password ) { $mcollective_psk_password = "defineme" }
}
