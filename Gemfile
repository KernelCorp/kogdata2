source 'https://rubygems.org'

#core
gem 'rails', '4.0.1'
gem 'mongoid', '4.0.0.beta1', github: 'mongoid/mongoid'

#front

# handlers
gem 'sass-rails', '~> 4.0.0'
gem 'haml-rails'
gem 'slim-rails'
gem 'coffee-rails', '~> 4.0.0'
gem 'compass-rails'

# assets
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bootstrap-sass', '~> 2.3.2'
gem 'haml_coffee_assets'
gem 'turbolinks'
gem 'fullcalendar-rails'
gem 'rails-backbone', github: 'codebrew/backbone-rails'
gem 'rails-backbone-forms'

# helpers
gem 'simple_form'

#back

# models extensions
gem 'paperclip'
gem 'mongoid-paperclip', require: 'mongoid_paperclip'

gem 'mongoid_slug'

# controllers flow
gem 'omniauth'
gem 'omniauth-vkontakte'

gem 'cancancan', '~> 1.8'

# mixed
gem 'devise'

gem 'therubyracer', platforms: :ruby

group :assets do
  gem 'haml_coffee_assets'
  gem 'execjs'
end

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
gem 'uglifier', '>= 1.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'quiet_assets'
  #gem 'rails-i18n-debug'
  gem 'net-ssh', '~> 2.7.0'
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'nginx-config'
end

group :test, :development do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'rack'
  gem 'coveralls', require: false
end

gem 'puma'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
