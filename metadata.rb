name             'maven-rally'
maintainer       'Rally Software Development Corp'
maintainer_email 'rallysoftware-cookbooks@rallydev.com'
license          'MIT'
description      'Installs/Configures maven'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'chromedriver::default', 'Installs chromedriver'

supports 'centos'
supports 'ubuntu'
