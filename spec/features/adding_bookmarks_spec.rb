feature 'adding bookmarks' do
  scenario 'user can add a bookmark' do
    visit '/bookmarks/new'
    fill_in('link', with: 'http://bbc.co.uk/sport')
    click_button "Add"

    expect(page).to have_content "http://bbc.co.uk/sport"
  end
end
