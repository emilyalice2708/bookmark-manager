require 'bookmark'

describe Bookmark do
  describe 'all' do
    it 'returns an array of bookmarks' do
      expect(Bookmark.all).to eq(["bookmark1", "bookmark2"])
    end
  end
end