# solr
script "install_solr" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  rm -rf /tmp/solr*

  wget http://apache.cu.be/lucene/solr/4.4.0/solr-4.4.0.tgz
  tar -xvf solr-4.4.0.tgz

  mv /tmp/solr-4.4.0 /opt/solr

  EOH
  not_if "test -f /opt/solr"
end
