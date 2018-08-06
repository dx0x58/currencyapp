source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'slim-rails'
gem 'interactor', '~> 3.0'
gem 'http'
gem 'simple_form'
gem 'redis'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver', '~> 3.3'
  gem 'webmock'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
  gem 'timecop'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
