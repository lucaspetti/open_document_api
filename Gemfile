# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'mongoid'
gem 'puma'
gem 'sinatra', git: 'git://github.com/sinatra/sinatra.git'

group :test do
  gem 'database_cleaner'
  gem 'mongoid-rspec'
  gem 'rack-test'
  gem 'rspec'
  gem 'simplecov'
end
