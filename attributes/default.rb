include_attribute "golang"

default[:signalfx][:directory] = "/opt/signalfx"
default[:signalfx][:user] = "signalfx"
default[:signalfx][:repo] = "github.com/signalfx/metricproxy"
default[:signalfx][:config_file] = "/etc/sfdbconfig.conf"
default[:signalfx][:log_dir] = "/var/log/sfproxy"
default[:signalfx][:pid_file] = "/var/run/metricproxy.pid"

default[:signalfx][:config][:stats_delay] = "1s"
default[:signalfx][:config][:forward] = [
  {
    "type" => "signalfx-json",
    "DefaultAuthToken" => "___AUTH_TOKEN___",
    "Name" => "testproxy",
  },
  {
    "Name" => "ourcarbon",
    "Host" => "example.com",
    "Port" => 2003,
    "type" => "carbon",
  },
  {
    "Filename" => "/tmp/filewrite.csv",
    "Name" => "filelocal",
    "type" => "csv",
  },
]

default[:signalfx][:config][:listen] = [
  {
    "Type" => "signalfx",
    "ListenAddr" => "0.0.0.0:18080",
  },
  {
    "Type" => "carbon",
    "ListenAddr" => "0.0.0.0:12003",
  },
]
