require 'comment'
require 'bookmark'
require 'database_helpers'

describe Comment do
  describe '.write' do
    it 'writes a new comment' do
      bookmark = Bookmark.add("http://www.google.com", "Google")
      comment = Comment.write("I like this website.", bookmark.id)

      data = persisted_data(table: 'comments', id: comment.id)

      expect(comment).to be_a Comment
      expect(comment.id).to eq data.first['id']
      expect(comment.text).to eq 'I like this website.'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end