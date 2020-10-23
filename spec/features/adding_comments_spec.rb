feature 'adding comments to bookmarks' do
  scenario 'user can write and add a comment' do
    bookmark = Bookmark.add("http://www.facebook.com", "Facebook")
    visit('/bookmarks')
    first(".bookmark").click_button "Write Comment"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in :comment, with: "This website is ruining my life."
    click_button "Submit"

    expect(current_path).to eq "/bookmarks"
    expect(first('.bookmark')).to have_content "This website is ruining my life."

  end
end