# Class: mcollective::plugins::agent::spamassassin
#
#
class mcollective::plugins::agent::spamassassin inherits mcollective::plugins::base {
	mcollective::plugin { "spamassassin":
		ensure       => present,
		type         => "agent",
		repo         => "mstanislav",
		ddl          => true,
		config       => true,
		config_order => 32
	}
}
