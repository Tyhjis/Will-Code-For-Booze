require 'spec_helper'

describe 'Books page' do
  it 'should not have any before been created' do
    visit references_path
    expect(page).to have_content('Listing references')
  end

  describe 'with correct parameters' do
    it 'should be able to create a new book reference' do
      visit references_path
      click_link 'New Book'
      fill_in('book_key', with:'1234569992')
      fill_in('book_author', with:'Erkki Hervanta')
      fill_in('book_title', with:'Boozeman journal')
      fill_in('book_publisher', with:'Helsinki')
      fill_in('book_year', with:'1999')

      expect{
        click_button('Create Book')
      }.to change{Book.count}.by(1)
      expect(page).to have_content 'Book type reference created'
    end
  end

  it 'correctly modifies an existing attribute' do
    visit references_path
    click_link 'New Book'
    fill_in('book_key', with:'1234569992')
    fill_in('book_author', with:'Erkki Hervanta')
    fill_in('book_title', with:'Boozeman journal')
    fill_in('book_publisher', with:'Helsinki')
    fill_in('book_year', with:'1999')
    click_button('Create Book')

    click_link 'Edit'

    expect(page).to have_content 'Editing book:'

    fill_in('book_author', with:'Jaska Jokunen')
    click_button 'Update Book'

    expect(page).to have_content 'Book was successfully updated.'
    expect(page).not_to have_content 'Erkki Hervanta'
    expect(page).to have_content 'Jaska Jokunen'

  end

  describe 'with wrong or empty parameters' do
    it 'should not be able to create book reference' do
      visit references_path
      click_link 'New Book'
      fill_in('book_author', with:'Erkki')
      expect{
        click_button('Create Book')
      }.to change{Book.count}.by(0)
    end

    it 'should contain an error message' do
      visit references_path
      click_link 'New Book'
      click_button('Create Book')
      expect(page).to have_content("Author can't be blank")
    end
  end
end