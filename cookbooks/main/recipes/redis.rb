# redis
script "install_redis" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  rm -rf /tmp/redis*
  wget http://redis.googlecode.com/files/redis-2.6.14.tar.gz
  tar -xvf redis-2.6.14.tar.gz
  mv /tmp/redis-2.6.14 /opt/redis
  cd /opt/redis
  make && make install
  cd utils && sh ./install_server.sh

  EOH
  not_if "test -f /opt/redis"
end
