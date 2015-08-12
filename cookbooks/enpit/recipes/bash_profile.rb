template "bash_profile" do
  user 'vagrant'
  source 'bash_profile.erb'
  path '/home/vagrant/.bash_profile'
  not_if 'test -f ~/home/vagrant/.bash_profile'
end
