feature 'view bookmarks' do
  scenario 'user can see bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("bookmark1")
    expect(page).to have_content("bookmark2")
  end
end