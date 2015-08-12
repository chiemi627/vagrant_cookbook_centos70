script "install_generate_rails" do
  not_if 'which generate_rails.sh'
  interpreter "bash"
  user "root"
  cwd "/usr/local/bin"
  code <<-EOH
  wget https://gist.githubusercontent.com/ychubachi/621182f2620bf6785f4f/raw/cbdeb98bcf3816a20233e51aee5ded02aaf3a24b/generate_rails.sh --no-check-certificate
  chmod 755 generate_rails.sh
  EOH
end
