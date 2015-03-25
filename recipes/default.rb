include_recipe "git"
include_recipe "golang"


# NB(hexedpackets): Don't modify any existing users.
# Only create one if the account doesn't exist.
user node[:signalfx][:user] do
  action :create
  home node[:signalfx][:directory]
  system true
  supports :manage_home => true
  not_if "getent passwd #{node[:signalfx][:user]}"
end

golang_package node[:signalfx][:repo] do
  action :install
end

link "#{node[:signalfx][:directory]}/metricproxy" do
  to "#{node[:go][:gopath]}/bin/metricproxy"
end

file node[:signalfx][:pid_file] do
  owner node[:signalfx][:user]
  mode 0644
end

template node[:signalfx][:config_file] do
  source "sfdbproxy.conf.erb"
  variables node[:signalfx][:config]
  owner node[:signalfx][:user]
  mode 0755
end

template "/etc/init.d/metricproxy" do
  source "init.erb"
  variables node[:signalfx]
  owner "root"
  group "root"
  mode 0755
end

service "metricproxy" do
  action [ :enable, :start ]
  supports :status => true, :restart => true
end
