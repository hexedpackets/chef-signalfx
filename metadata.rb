name             'signalfx'
maintainer       'Wildcard'
maintainer_email 'william@trywildcard.com'
license          'MIT'
description      'Installs/Configures signalfx metricproxy'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'golang', '>= 1.4'
depends 'git'

supports 'ubuntu'
supports 'debian'
