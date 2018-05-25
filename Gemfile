source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1'
gem 'bootsnap'
# Use pg as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'

gem 'momentjs-rails'
gem 'fullcalendar'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
gem 'jquery-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'better_errors'
  gem 'rails_layout'
end

group :heroku do
  gem 'rails_log_stdout', github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'listen'
gem 'devise'

#USED TO FAKE DATA IN SEED
gem 'faker'

#active admin
gem 'activeadmin', git: 'https://github.com/activeadmin/activeadmin'
gem "active_admin_import" , github: "activeadmin-plugins/active_admin_import"
gem 'active_skin'
gem 'cancancan'

#form fields
gem 'sass-rails'
gem 'bootstrap_form'
gem 'simple_form'
gem 'nilify_blanks'

gem 'pdfkit'
gem 'wkhtmltopdf-binary'
gem 'prawn'
gem 'prawn-table'


#AWS
gem 'carrierwave'
gem 'fog-aws'

#reporting
gem 'chartkick'
gem 'groupdate'
gem 'whenever', :require => false

gem "will_paginate", :git => "https://github.com/mislav/will_paginate.git"
gem 'rack-cache'
gem 'has_scope'

gem 'gon'
