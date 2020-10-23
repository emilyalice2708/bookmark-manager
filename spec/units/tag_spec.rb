require 'tag'
require 'bookmark'
require 'database_helpers'

describe Tag do
  
  describe '.create' do
    it 'creates a new tag' do
      bookmark = Bookmark.add("http://www.twitter.com", "Twitter")
      tag = Tag.create("Social", bookmark.id)
      data = persisted_data(table: 'tags', id: tag.id)

      expect(tag).to be_a Tag
      expect(tag.id).to eq data.first['id']
      expect(tag.content).to eq "Social"
    end
  end
 
  describe '.return_tags' do
    it 'returns tags for specific bookmarks' do
      bookmark = Bookmark.add("http://www.twitter.com", "Twitter")
      tag_1 = Tag.create("Social", bookmark.id)
      tag_2 = Tag.create("Procrastination", bookmark.id)

      tag_array = Tag.return_tags(bookmark.id)
      tag = tag_array.first 
      expect(tag_array.length).to eq 2
      expect(tag).to be_a Tag
      expect(tag.id).to eq tag_1.id
      expect(tag.content).to eq tag_1.content
    end
  end
end
