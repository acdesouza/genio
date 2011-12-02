source 'http://rubygems.org'

gem 'rails'
gem 'heroku'
gem 'devise'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  # To use debugger
  # gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'minitest'
  # Pretty printed test output
  # gem 'turn', :require => false # Don't work with autotest
  gem 'ZenTest'
  gem 'autotest-rails'
  # gem 'autotest-fsevent'
  # gem 'autotest-growl' # MacOSX only
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
