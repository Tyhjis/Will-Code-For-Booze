require 'spec_helper'

describe 'Inproceedings page' do

  before :all do
    self.use_transactional_fixtures = false
    WebMock.disable_net_connect!(allow_localhost:true)
  end

  before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    visit new_inproceeding_path
  end

  after :each do
    DatabaseCleaner.clean
  end

  after :all do
    self.use_transactional_fixtures = true
  end

  it 'should have Authorgi field' do
    expect(page).to have_content "Author"
  end

  it 'should create new inproceeding reference with miminum requirements' do
    fill_in('inproceeding_author', with:"jörö")
    fill_in('inproceeding_title', with:"teosX")
    fill_in('inproceeding_booktitle', with:"jotain")
    fill_in('inproceeding_year', with:"2012")
    click_button('Create Inproceeding')

    expect(page).to have_content "jörö"
  end

end