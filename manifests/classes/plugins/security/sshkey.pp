# Class: mcollective::plugins::security::sshkey
#
#
class mcollective::plugins::security::sshkey {
	mcollective::plugin { "sshkey":
		ensure       => present,
		type         => "security"
	}
}
