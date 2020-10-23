feature 'adding tags' do
  scenario 'user can add tags to bookmarks' do
    bookmark = Bookmark.add("http://www.twitter.com", "Twitter")
    visit('/bookmarks')
    first('.bookmark').click_button "Add Tag"
    expect(current_path).to eq "bookmarks/#{bookmark.id}/tags/new"
    fill_in :tag, with: 'Social'
    click_button 'Submit'
    expect(current_path).to eq '/bookmarks'
    expect(first('.bookmark')).to have_content 'Social'
  end
end