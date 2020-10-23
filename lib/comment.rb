require_relative 'database_connection'
require_relative 'bookmark'

class Comment
  attr_reader :id, :text, :bookmark_id

  def initialize(id, text, bookmark_id)
    @id = id 
    @text = text
    @bookmark_id = bookmark_id
  end

  def self.write(text, bookmark_id)
    result = DatabaseConnection.query("INSERT INTO comments (bookmark_id, text) VALUES ('#{bookmark_id}','#{text}') RETURNING id, text, bookmark_id;")
    Comment.new(result[0]['id'], result[0]['text'], result[0]['bookmark_id'])
  end
end