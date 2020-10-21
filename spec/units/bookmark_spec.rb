require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns an array of bookmarks' do
      Bookmark.add('http://www.makersacademy.com')
      Bookmark.add('http://www.google.com')
      Bookmark.add('http://www.destroyallsoftware.com')

      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
       Bookmark.add("http://bbc.co.uk/sport")
       expect(Bookmark.all).to include("http://bbc.co.uk/sport")
    end
  end
end