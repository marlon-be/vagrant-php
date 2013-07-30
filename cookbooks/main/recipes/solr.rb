# solr
script "install_solr" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  rm -rf /tmp/solr*

  wget http://apache.cu.be/lucene/solr/4.1.0/solr-4.1.0.tgz
  tar -xvf solr-4.1.0.tgz

  mkdir -p /opt/solr/data
  chown -R tomcat6 /opt/solr/data

  cp -R /tmp/solr-4.1.0/example/solr/* /opt/solr
  cp /tmp/solr-4.1.0/example/webapps/solr.war /opt/solr

  EOH
  not_if "test -f /opt/solr"
end
