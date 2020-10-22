feature 'deleting bookmarks' do
  scenario 'user deletes a bookmark' do
    Bookmark.add('http://www.google.com', 'Google')
    visit('/bookmarks')
    expect(page).to have_link "Google", href: "http://www.google.com"
    first('.bookmark').click_button 'Delete'

    expect(page).not_to have_link "Google", href: "http://www.google.com"
  end
end