script "install_github-connect" do
  not_if 'which github-connect.sh'
  interpreter "bash"
  user "root"
  cwd "/usr/local/bin"
  code <<-EOH
  wget https://gist.github.com/ychubachi/6491682/raw/github-connect.sh --no-check-certificate
  chmod 755 github-connect.sh
  EOH
end
