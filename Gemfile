source 'http://rubygems.org'

gem "spree", :git => "https://github.com/tka/spree.git"

gem 'sqlite3'
gem 'cells'

group :test do
  gem 'capybara', '1.0.1'
  gem 'ffaker'
  gem 'factory_girl'
end

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end

gemspec
