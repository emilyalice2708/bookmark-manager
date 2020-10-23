require 'pg'
require_relative 'database_connection'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
  end

  def self.add(link, title)  
    result = DatabaseConnection.query "INSERT INTO bookmarks (url, title) VALUES('#{link}', '#{title}') RETURNING id, title, url;"
    # Below method ensures a return value we can work with in tests
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id, new_link, new_title)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{new_link}', title = '#{new_title}' WHERE id= '#{id}' RETURNING id, title, url;")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end
end