require './app'

feature 'testing infrastrucutre' do
  scenario 'Homepage is displayed' do
    visit('/bookmarks')
    expect(page).to have_content('Bookmarks')
  end 
end