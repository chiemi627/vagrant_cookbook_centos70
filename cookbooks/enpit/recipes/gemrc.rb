template "gemrc" do
  user 'vagrant'
  source 'gemrc.erb'
  path '/home/vagrant/.gemrc'
  not_if 'test -f ~/home/vagrant/.gemrc'
end
