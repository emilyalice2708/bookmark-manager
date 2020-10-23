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

  describe '.return comments' do
    it 'returns comments for specific bookmark' do
      bookmark = Bookmark.add("http://www.google.com", "Google")
      comment_1 = Comment.write("Decent website", bookmark.id)
      comment_2 = Comment.write("Rubbish website", bookmark.id)

      comments = Comment.return_comments(bookmark.id)
      first_comment = comments.first
      data = persisted_data(table: 'comments', id: comment_1.id)

      expect(comments.length).to eq 2
      expect(first_comment.id).to eq data.first['id']
      expect(first_comment.id).to eq comment_1.id
      expect(first_comment.text).to eq "Decent website"
      expect(first_comment.bookmark_id).to eq bookmark.id

    end
  end
end