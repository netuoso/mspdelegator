source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'jquery-rails'
gem 'jquery-tablesorter'
gem 'boostrap-sass'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'

gem 'config'
gem 'steem_api'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end