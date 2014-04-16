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

  it 'shows correct bibtex string in showing reference' do
    visit references_path
    click_link 'New Book'
    fill_in('book_key', with:'1234569992')
    fill_in('book_author', with:'Erkki Hervanta')
    fill_in('book_title', with:'Boozeman journal')
    fill_in('book_publisher', with:'Helsinki')
    fill_in('book_year', with:'1999')
    click_button('Create Book')

    click_link 'Show'
    expect(page).to have_content '@BOOK{1234569992, author = {Erkki Hervanta}, title = {Boozeman journal}, year = {1999}, publisher = {Helsinki}}'
  end

  it 'show correct bibtex string for all references' do
    make_books

    click_link 'Get BIBTEX'

    expect(page).to have_content '@BOOK{1234569992, author = {Erkki Hervanta}, title = {Boozeman journal}, year = {1999}, publisher = {Helsinki}}@BOOK{123456999, author = {Erkki Hervanta}, title = {Boozeman journal}, year = {1999}, publisher = {Helsinki}}'
  end

  it 'is definitely listing references' do
    visit references_path
    expect(page).to have_content 'Listing references'
  end

  it 'shows all specified fields' do

    visit references_path
    expect(page).to have_content 'Type'
    expect(page).to have_content 'Key'
    expect(page).to have_content 'Author'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Publisher'
    expect(page).to have_content 'Journal'
    expect(page).to have_content 'Booktitle'
    expect(page).to have_content 'Pages'

  end

end

def make_books
  visit references_path
  click_link 'New Book'
  fill_in('book_key', with:'1234569992')
  fill_in('book_author', with:'Erkki Hervanta')
  fill_in('book_title', with:'Boozeman journal')
  fill_in('book_publisher', with:'Helsinki')
  fill_in('book_year', with:'1999')
  click_button('Create Book')

  visit references_path
  click_link 'New Book'
  fill_in('book_key', with:'123456999')
  fill_in('book_author', with:'Erkki Hervanta')
  fill_in('book_title', with:'Boozeman journal')
  fill_in('book_publisher', with:'Helsinki')
  fill_in('book_year', with:'1999')
  click_button('Create Book')

end