# Class: mcollective::server::install
#
#
class mcollective::server::install {
	include repositories::ubuntu::vurbia::main, repositories::ubuntu::puppetlabs::main, repositories::ubuntu::brightbox::main, repositories::ubuntu::brightbox::rubyee
	
	package { mcollective:
		ensure  => latest,
		require => [ Class["repositories::ubuntu::vurbia::main"], Class["repositories::ubuntu::puppetlabs::main"],
					  Class["repositories::ubuntu::brightbox::main"], Class["repositories::ubuntu::brightbox::rubyee"] ]
	}
}