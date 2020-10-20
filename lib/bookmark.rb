require 'pg'

class Bookmark
  def self.all
    con = PG.connect( dbname: 'bookmark_manager' )
    result = con.exec "SELECT * FROM bookmarks"
    result.map { |row| row['url'] }
    end
end