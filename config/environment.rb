require 'bundler'
#no clue why this works - make sure to ask
require 'socket'
require 'socksify/http'
require 'uri'
require 'net/http'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
