feature 'updating bookmarks' do
  scenario 'user can update a bookmark' do
    new_bookmark = Bookmark.add("http://www.twitter.com", "Twitter")
    visit('/bookmarks')
    expect(page).to have_link "Twitter", href: "http://www.twitter.com"

    first('.bookmark').click_button "Edit"
    expect(current_path).to eq "/bookmarks/#{new_bookmark.id}/edit"

    fill_in('link', with: "http://www.instagram.com")
    fill_in('title', with: "Instagram")
    click_button "Submit"

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link "Twitter", href: "http://www.twitter.com"
    expect(page).to have_link "Instagram", href: "http://www.instagram.com"
  end
end