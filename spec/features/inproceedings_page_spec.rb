require 'spec_helper'

describe 'Inproceedings page' do

  before :all do
    self.use_transactional_fixtures = false
    WebMock.disable_net_connect!(allow_localhost:true)
  end

  before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    visit references_path
  end

  after :each do
    DatabaseCleaner.clean
  end

  after :all do
    self.use_transactional_fixtures = true
  end

  it 'should have Author field' do
    click_link 'New Inproceeding'
    expect(page).to have_content 'Author'
  end

  it 'shows all required fields in creation' do
    click_link 'New Inproceeding'
    expect(page).to have_content 'Required fields:'
    expect(page).to have_content 'Author:'
    expect(page).to have_content 'Title:'
    expect(page).to have_content 'Booktitle:'
    expect(page).to have_content 'Year:'
  end

  it 'correctly modifies an existing attribute' do
    click_link 'New Inproceeding'
    fill_in('inproceeding_author', with:'jörö')
    fill_in('inproceeding_title', with:'teosX')
    fill_in('inproceeding_booktitle', with:'jotain')
    fill_in('inproceeding_year', with:'2012')
    click_button('Create Inproceeding')

    click_link 'Edit'
    expect(page).to have_content 'Edit Inproceedings:'

    fill_in('inproceeding_author', with:'Jaska Jokunen')
    click_button 'Update Inproceeding'
    expect(page).to have_content 'Inproceedings was successfully updated.'
    expect(page).not_to have_content 'jörö'
    expect(page).to have_content 'Jaska Jokunen'
  end

  it 'correctly includes a new attribute' do
    click_link 'New Inproceeding'
    fill_in('inproceeding_author', with:'jörö')
    fill_in('inproceeding_title', with:'teosX')
    fill_in('inproceeding_booktitle', with:'jotain')
    fill_in('inproceeding_year', with:'2012')
    click_button('Create Inproceeding')

    click_link 'Edit'
    expect(page).to have_content 'Edit Inproceedings:'

    fill_in('inproceeding_editor', with:'Salamanteri')
    click_button 'Update Inproceeding'
    expect(page).to have_content 'Inproceedings was successfully updated.'
    click_link 'Show'
    expect(page).to have_content 'Editor: Salamanteri'
  end

  it 'does not save an article with not all required fields present' do
    click_link 'New Inproceeding'
    fill_in('inproceeding_author', with:'jaska jokunen')
    fill_in('inproceeding_title', with:'jokusen muistelma')
    click_button('Create Inproceeding')

    expect(page).to have_content 'Booktitle is too short (minimum is 3 characters)'
    expect(page).to have_content 'Year is not a number'
  end

  it 'should create new inproceeding reference with miminum requirements' do
    click_link 'New Inproceeding'
    fill_in('inproceeding_author', with:'jörö')
    fill_in('inproceeding_title', with:'teosX')
    fill_in('inproceeding_booktitle', with:'jotain')
    fill_in('inproceeding_year', with:'2012')
    click_button('Create Inproceeding')

    expect(page).to have_content 'jörö'
  end

end