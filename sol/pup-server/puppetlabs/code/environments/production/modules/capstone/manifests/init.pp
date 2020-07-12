class capstone {

file { '/home/ubuntu/config-management':
  ensure => directory,
}

exec { 'apache-present':
  creates => '/home/ubuntu/config-management/status.txt',
  command => 'echo "This is an Apache Server, and Apache is present" > /home/ubuntu/config-management/status.txt',
  path => '/bin:/sbin:/usr/bin/:/usr/sbin',
  onlyif => 'which apache2',
}

exec { 'apache-absent':
  creates => '/home/ubuntu/config-management/status.txt',
  command => 'echo "This is not an Apache Server, and Apache is absent" > /home/ubuntu/config-management/status.txt',
  path => '/bin:/sbin:/usr/bin/:/usr/sbin',
  unless => 'which apache2',
}

exec { 'git-present':
  creates => '/home/ubuntu/config-management/git-status.txt',
  command => 'echo "git is present" > /home/ubuntu/config-management/git-status.txt',
  path => '/bin:/sbin:/usr/bin/:/usr/sbin',
  onlyif => 'which git',
}

exec { 'git-absent':
  creates => '/home/ubuntu/config-management/git-status.txt',
  command => 'echo "git is absent" > /home/ubuntu/config-management/git-status.txt',
  path => '/bin:/sbin:/usr/bin/:/usr/sbin',
  unless => 'which git',
}

}
