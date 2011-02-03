# Define: mcollective::plugin::ddl
# Parameters:
# arguments
#
define mcollective::plugin::ddl ($ensure = present, $source, $target) {
	case $ensure {
		present: {
			# We might be calling this definition from two different places
			if !defined(File[$target]) {
				file { $target:
					ensure => present,
					source => $source,
					mode   => 644,
					owner  => root,
					group  => root,
					require => Class["mcollective::common"]
				}
			}
			
			realize(File[$target])
		}
		absent: {
			file { $name:
				ensure => absent,
				path   => $target
			}
		}
	}
}
