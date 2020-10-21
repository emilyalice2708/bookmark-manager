require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns an array of bookmarks' do
      bookmark = Bookmark.add('http://www.makersacademy.com', 'Makers')
      Bookmark.add('http://www.google.com', 'Google')
      Bookmark.add('http://www.destroyallsoftware.com', 'Destroy All Software')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Makers"
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
       new_bookmark = Bookmark.add("http://bbc.co.uk/sport", "BBC")
       data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{new_bookmark.id};")
       
       expect(new_bookmark).to be_a Bookmark
       expect(new_bookmark.id).to eq data.first['id']
       expect(new_bookmark.url).to eq "http://bbc.co.uk/sport"
       expect(new_bookmark.title).to eq "BBC"
    end
  end
end