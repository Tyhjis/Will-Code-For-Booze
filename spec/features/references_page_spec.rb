require 'spec_helper'

describe 'References page' do

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

  it 'shows links to creating article, inproceedings and book reference' do

    visit references_path
    expect(page).to have_content 'New Inproceeding'
    expect(page).to have_content 'New Article'
    expect(page).to have_content 'New Book'

  end

  it 'is definitely listing references' do
    visit references_path
    expect(page).to have_content 'Listing references'
  end

end