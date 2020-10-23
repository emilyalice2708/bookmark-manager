require 'pg'

def reset_test_database
  connection = PG.connect :dbname => 'bookmark_manager_test'
  connection.exec("TRUNCATE comments, bookmarks, tags, bookmark_tags;")
end