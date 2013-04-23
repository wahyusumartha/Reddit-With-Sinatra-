require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/reddit.db")

require_relative 'link'
