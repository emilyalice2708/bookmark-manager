require './lib/database_connection'

def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * from #{table} WHERE id = '#{id}';")
end