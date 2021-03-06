source 'https://rubygems.org'
ruby '2.3.3'

git_source(:github) do |repo_name|
  repository = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
  'https://github.com/#{repository}.git'
end

#  Required for Active Admin
gem 'activeadmin', git: 'https://github.com/activeadmin/activeadmin'
# Bootstrap gem wrapper
gem 'bootstrap', '~> 4.0.0.alpha6'
# For image uploading
gem 'carrierwave', '~> 1.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
#  Required for Active Admin
gem 'devise'
#  Required for Active Admin
gem 'inherited_resources', git: 'https://github.com/activeadmin/inherited_resources'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# postgresql gem
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# for postgresql support. suggested by heroku
gem 'rails_12factor', group: :production
# For rubocop
gem 'rubocop', '~> 0.48.0', require: false
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Gem to use Slim instead of ERB in our views. http://slim-lang.com/
gem 'slim-rails'
# stripe for payment processing
gem 'stripe'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %I(mingw mswin x64_mingw jruby)
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

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
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages
  # or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end
