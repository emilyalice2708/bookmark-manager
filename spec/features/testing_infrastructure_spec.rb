require './app'

feature 'testing infrastrucutre' do
  scenario 'Hello, world is displayed on home page' do
    visit('/')
    expect(page).to have_content('Bookmarks')
  end 
end