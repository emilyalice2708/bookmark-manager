feature 'adding bookmarks' do
  scenario 'user can add a bookmark' do
    visit '/bookmarks/new'
    fill_in('link', with: 'http://bbc.co.uk/sport')
    fill_in('title', with: 'BBC')
    click_button "Add"

    expect(page).to have_link "BBC", href: "http://bbc.co.uk/sport"
  end

  scenario 'user attempts to add invalid bookmark url' do
    visit ('/bookmarks/new')
    fill_in('link', with: 'Invalid URL')
    fill_in('title', with: 'Invalid Title')
    click_button "Add"

    expect(page).to have_content "Please enter a valid URL"
    expect(page).not_to have_content "Invalid URL"
    expect(page).not_to have_content "Invalid Title"
  end
end
