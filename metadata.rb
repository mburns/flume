name 'flume'
maintainer 'Chris Howe - Infochimps, Inc'
maintainer_email 'coders@infochimps.com'
license 'Apache 2.0'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.2.3'

description 'Flume: reliable decoupled shipment of logs and data.'

depends 'java'
depends 'maven'
depends 'thrift'
depends 'apt'
depends 'runit'
depends 'volumes'
depends 'silverware'
depends 'hadoop_cluster'

recipe 'flume::default',                     'Base configuration for flume'
recipe 'flume::master',                      'Configures Flume Master, installs and starts service'
recipe 'flume::make_dirs',                   'Ties directories to available volumes'
recipe 'flume::install_from_git',            'Install flume using designated git repo and branch'
recipe 'flume::install_from_package',        'Install flume using package manager'
recipe 'flume::agent',                       'Configures Flume Agent, installs and starts service'
recipe 'flume::plugin-hbase_sink',           'Hbase Sink Plugin'
recipe 'flume::plugin-jruby',                'Jruby Plugin'
recipe 'flume::test_flow',                   'Test Flow'
recipe 'flume::test_s3_source',              'Test S3 source'
recipe 'flume::config_files',                'Finalizes the config, writes out the config files'

%w(debian ubuntu).each do |os|
  supports os
end

attribute 'flume/aws_access_key',
          display_name: 'AWS access key used for writing to s3 buckets',
          description: 'AWS access key used for writing to s3 buckets',
          default: ''

attribute 'flume/aws_secret_key',
          display_name: 'AWS secret key used for writing to s3 buckets',
          description: 'AWS secret key used for writing to s3 buckets',
          default: ''

attribute 'flume/cluster_name',
          display_name: '',
          description: 'The name of the cluster to participate with (masters and zookeepers...)',
          default: 'cluster_name'

attribute 'flume/plugins',
          display_name: 'Hash for plugin configuration',
          description: 'If you have a particular plugin to configure, you can also configure the classpath and the classes to include in the configuration file with attributes',
          default: ''

attribute 'flume/classes',
          display_name: '',
          description: 'classes to include as plugins',
          default: ''

attribute 'flume/classpath',
          display_name: 'list of directories and jars to add to the FLUME_CLASSPATH',
          description: 'list of directories and jars to add to the FLUME_CLASSPATH',
          default: ''

attribute 'flume/java_opts',
          display_name: 'list of command line parameters to add to the jvm',
          description: 'list of command line parameters to add to the jvm',
          default: ''

attribute 'flume/collector',
          display_name: "Format of node's logs",
          description: 'output_format -- Controls what format the node writes logs',
          default: ''

attribute 'flume/data_dir',
          display_name: 'Directory for local in-transit files',
          description: 'Directory for local in-transit files',
          default: '/data/db/flume'

attribute 'flume/home_dir',
          display_name: '',
          description: '',
          default: '/usr/lib/flume'

attribute 'flume/conf_dir',
          display_name: '',
          description: "default[:flume][:tmp_dir]               = '/mnt/flume/tmp'",
          default: '/etc/flume/conf'

attribute 'flume/log_dir',
          display_name: '',
          description: '',
          default: '/var/log/flume'

attribute 'flume/pid_dir',
          display_name: '',
          description: '',
          default: '/var/run/flume'

attribute 'flume/master/external_zookeeper',
          display_name: "false to use flume's zookeeper. True to attach to an external zookeeper.",
          description: 'By default, flume installs its own zookeeper instance',
          default: 'false'

attribute 'flume/master/zookeeper_port',
          display_name: 'port to talk to zookeeper on (for external zookeeper)',
          description: 'port to talk to zookeeper on (for external zookeeper)',
          default: '2181'

attribute 'flume/master/run_state',
          display_name: '',
          description: '',
          default: 'stop'

attribute 'flume/node/run_state',
          display_name: '',
          description: '',
          default: 'start'
