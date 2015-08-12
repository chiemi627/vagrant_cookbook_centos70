template "gitconfig" do
  user 'vagrant'
  source 'gitconfig.erb'
  path '/home/vagrant/.gitconfig'
  not_if 'test -f ~/home/vagrant/.gitconfig'
end
