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
    expect(page).to have_content 'Required fields:'
    expect(page).to have_content 'Author:'
    expect(page).to have_content 'Title:'
    expect(page).to have_content 'Journal:'
    expect(page).to have_content 'Year:'
  end

  it 'saves the article if all required fields are present' do
    visit new_article_path
    fill_in('article_author', with:'jaska jokunen')
    fill_in('article_title', with:'jokusen muistelma')
    fill_in('article_journal', with:'jokusen päiväkirjat')
    fill_in('article_year', with:'1990')
    click_button('Create Article')

    expect(page).to have_content 'Article type reference created'
    expect(page).to have_content 'jaska jokunen'
    expect(page).to have_content 'jokusen muistelma'
  end

  it 'does not save an article with not all required fields present' do
    visit new_article_path
    fill_in('article_author', with:'jaska jokunen')
    fill_in('article_title', with:'jokusen muistelma')
    click_button('Create Article')

    expect(page).to have_content 'Journal is too short (minimum is 3 characters)'
    expect(page).to have_content 'Year is not a number'
  end

  it 'saves an article with proper key' do
    visit new_article_path
    fill_in('article_author', with:'jaska jokunen')
    fill_in('article_title', with:'jokusen muistelma')
    fill_in('article_journal', with:'jokusen päiväkirjat')
    fill_in('article_year', with:'1990')
    fill_in('article_key', with:'jaska1990')
    click_button('Create Article')

    expect(page).to have_content 'Article type reference created'
    expect(page).to have_content 'jaska jokunen'
    expect(page).to have_content 'jokusen muistelma'
  end

  it 'has working edit link after creating a new article' do
    visit new_article_path
    fill_in('article_author', with:'jaska jokunen')
    fill_in('article_title', with: 'jokusen seikkailu')
    fill_in('article_journal', with: 'jokunen ja synkkä metsä')
    fill_in('article_year', with: '1997')
    fill_in('article_key', with: 'asdasd123')
    click_button('Create Article')

    click_link('Edit')
    expect(page).to have_content 'Editing article: asdasd123'
  end

  it 'saves the edited article' do
    visit new_article_path
    fill_in('article_author', with:'jaska jokunen')
    fill_in('article_title', with: 'jokusen seikkailu')
    fill_in('article_journal', with: 'jokunen ja synkkä metsä')
    fill_in('article_year', with: '1997')
    fill_in('article_key', with: 'asdasd123')
    click_button('Create Article')

    click_link('Edit')

    fill_in('article_author', with:'jaska jokunen1')
    fill_in('article_title', with: 'jokusen seikkailu1')
    fill_in('article_journal', with: 'jokunen ja synkkä metsä1')
    fill_in('article_year', with: '1998')
    fill_in('article_key', with: 'asdasd1231')

    click_button('Update Article')

    expect(page).to have_content 'jaska jokunen1'
  end

  it 'has no original article left after editing' do
    visit new_article_path
    fill_in('article_author', with:'jaska jokunen')
    fill_in('article_title', with: 'jokusen seikkailu')
    fill_in('article_journal', with: 'jokunen ja synkkä metsä')
    fill_in('article_year', with: '1997')
    fill_in('article_key', with: 'asdasd123')
    click_button('Create Article')

    click_link('Edit')

    fill_in('article_author', with:'aaaa')
    fill_in('article_title', with: 'aaaaa')
    fill_in('article_journal', with: 'jokunen ja synkkä metsä1')
    fill_in('article_year', with: '1998')
    fill_in('article_key', with: 'asdasd1231')

    click_button('Update Article')

    expect(page).not_to have_content 'jaska'
  end

  it 'does not update the article if it has empty required fields' do
    visit new_article_path
    fill_in('article_author', with:'jaska jokunen')
    fill_in('article_title', with: 'jokusen seikkailu')
    fill_in('article_journal', with: 'jokunen ja synkkä metsä')
    fill_in('article_year', with: '1997')
    fill_in('article_key', with: 'asdasd123')
    click_button('Create Article')

    click_link('Edit')

    fill_in('article_author', with:'')
    fill_in('article_title', with: 'jokusen seikkailu1')
    fill_in('article_journal', with: 'jokunen ja synkkä metsä1')
    fill_in('article_year', with: '1998')
    fill_in('article_key', with: 'asdasd1231')

    click_button('Update Article')

    expect(page).to have_content 'Editing article'
    expect(page).to have_content 'error'

    fill_in('article_author', with:'jaskaaa')
    fill_in('article_title', with: '')

    expect(page).to have_content 'Editing article'
    expect(page).to have_content 'error'

    fill_in('article_title', with: 'jokusen seikkailu1')
    fill_in('article_journal', with: '')

    expect(page).to have_content 'Editing article'
    expect(page).to have_content 'error'

    fill_in('article_journal', with: 'jokunen ja synkkä metsä1')
    fill_in('article_year', with: '1000')

    expect(page).to have_content 'Editing article'
    expect(page).to have_content 'error'
  end



end