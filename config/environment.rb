require 'pry'
require 'bundler'
require "tty-prompt" #lets us use the ttyl prompt in cli.rb

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil
require_all 'app'

