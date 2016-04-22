# Statistics Tracker [Basketball Tourney]

# require database gem
require 'sqlite3'

# create database
basketballdb = SQLite3::Database.new("basketball.db")
# deliver data as a hash data structure (formula found on sql docs)
basketballdb.results_as_hash = true