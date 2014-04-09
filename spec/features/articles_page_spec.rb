require 'spec_helper'

describe 'Article page' do

  before :all do
    self.use_transactional_fixtures = false
    WebMock.disable_net_connect!(allow_localhost:true)
  end

  before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end

  after :all do
    self.use_transactional_fixtures = true
  end

  it 'shows all required fields in creation' do
    visit new_article_path
    expect(page).to have_content "Required fields:"
    expect(page).to have_content "Author:"
    expect(page).to have_content "Title:"
    expect(page).to have_content "Journal:"
    expect(page).to have_content "Year:"
  end

  it 'saves the article if all required fields are present' do
    visit new_article_path
    fill_in('article_author', with:"jaska jokunen")
    fill_in('article_title', with:"jokusen muistelma")
    fill_in('article_journal', with:"jokusen päiväkirjat")
    fill_in('article_year', with:"1990")
    click_button('Create Article')

    expect(page).to have_content "Article type reference created"
    expect(page).to have_content "jaska jokunen"
    expect(page).to have_content "jokusen muistelma"
  end

end