source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'bootstrap-sass',
  :git => 'git://github.com/thomas-mcdonald/bootstrap-sass.git',
  :branch => '3'
gem 'bcrypt-ruby', '~> 3.1.0'
gem 'faker', '~> 1.2.0'
gem 'will_paginate', '~> 3.0.4'
gem 'bootstrap-will_paginate', '~> 0.0.9'
gem 'jquery-rails', '~> 3.0.1'
gem 'turbolinks', '~> 1.3.0'
gem 'therubyracer', '~> 0.11.4'

gem 'sass-rails', '~> 4.0.0.beta1'
gem 'coffee-rails', '~> 4.0.0.beta1'
gem 'uglifier', '~> 2.1.1'

gem 'coveralls', require: false
gem 'newrelic_rpm', '~> 3.6.6.147'
gem 'devise', '~> 3.0.0.rc'
gem 'cancan', '~> 1.6.10'

group :development, :test do
  gem 'sqlite3', '~> 1.3.7'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'guard-rspec', '~> 3.0.2'
  gem 'guard-spork', '~> 1.5.0'  
  gem 'childprocess', '~> 0.3.6'
  gem 'spork', '~> 0.9.2'
end

group :test do
  gem 'capybara', '~> 2.1.0'
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'database_cleaner', '~> 1.0.1'
end

group :production do
  gem 'pg', '~> 0.16.0'
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end
