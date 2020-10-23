require_relative 'bookmark'

class Tag
  attr_reader :id, :content
  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.create(content, bookmark_id)
    result = DatabaseConnection.query("INSERT INTO tags (content) VALUES('#{content}') RETURNING id, content;")
    DatabaseConnection.query("INSERT INTO bookmark_tags (bookmark_id, tag_id) VALUES('#{bookmark_id}', '#{result[0]['id']}');")
    Tag.new(result[0]['id'], result[0]['content'])
  end

  def self.return_tags(bookmark_id)
    result = DatabaseConnection.query("SELECT tags.id, content FROM bookmark_tags INNER JOIN tags ON tags.id = bookmark_tags.tag_id WHERE bookmark_tags.bookmark_id = #{bookmark_id};")
    result.map do |tag|
      Tag.new(tag['id'], tag['content'])
    end
  end
end

