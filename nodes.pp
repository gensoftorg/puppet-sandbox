#
# nodes.pp - defines all puppet nodes
#

# self-manage the puppet master server
# import 'init.pp'
node 'puppet' {}

##### CLIENTS

node 'client1' {
  # include helloworld
  # class { 'helloworld': }
  file { '/tmp/hello':
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
    content => "world\n",
  }
  package { 'nginx-full':
    ensure => 'present',
  }
  service { 'nginx':
    ensure  => 'running',
    enable  => true,
    require => Package['nginx-full'],
  }
}

node 'client2' {}
