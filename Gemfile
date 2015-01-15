source 'https://rubygems.org'

# Specify your gem's dependencies in fog.gemspec
gemspec
gem 'actionview'
gem 'rspec'
%w[rspec-core rspec-expectations rspec-mocks rspec-support].each do |lib|
  gem lib, :git => "git://github.com/rspec/#{lib}.git", :branch => 'master'
end
group :development do
  gem 'byebug'
end
