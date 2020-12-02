require 'bundler'
Bundler.require

require 'open-uri'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/rooms-development.sqlite"
)

require_all 'lib'