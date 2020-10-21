feature 'view bookmarks' do
  scenario 'user can see bookmarks' do
    Bookmark.add('http://www.makersacademy.com', 'Makers')
    Bookmark.add('http://www.google.com', 'Google')
    Bookmark.add('http://www.destroyallsoftware.com', 'Destroy All Software')

    visit('/bookmarks')
    
    expect(page).to have_link "Makers", href: "http://www.makersacademy.com"
    expect(page).to have_link "Google", href: "http://www.google.com"
    expect(page).to have_link "Destroy All Software", href: "http://www.destroyallsoftware.com"
  end
end