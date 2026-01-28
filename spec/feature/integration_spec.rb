# an integration test to make sure that the book is added successfully to the database as indicated by the correct ‘flash notice.’ Likewise, test a ‘rainy-day’ scenario by trying to save a book with a ‘title’ blank, where you look for the corresponding ‘flash notice.
require 'rails_helper'
RSpec.describe 'Book Management', type: :feature do
    it 'shows the correct flash notice when a book is created successfully' do
        visit new_book_path
        fill_in 'Title', with: 'The Great Gatsby'
        fill_in 'Author', with: 'F. Scott Fitzgerald'
        fill_in 'Price', with: '10.99'
        fill_in 'Date published', with: '1925-04-10'
        click_button 'Create Book'
        expect(page).to have_content('Book was successfully created.')
    end
    it 'does not show a flash notice when book creation fails due to blank title' do
        visit new_book_path
        fill_in 'Title', with: ''
        fill_in 'Author', with: 'F. Scott Fitzgerald'
        fill_in 'Price', with: '10.99'
        fill_in 'Date published', with: '1925-04-10'
        click_button 'Create Book'
        expect(page).not_to have_content('Book was successfully created.')
    end
    it 'does not show a flash notice when book creation fails due to blank author' do
        visit new_book_path
        fill_in 'Title', with: 'The Great Gatsby'
        fill_in 'Author', with: ''
        fill_in 'Price', with: '10.99'
        fill_in 'Date published', with: '1925-04-10'
        click_button 'Create Book'
        expect(page).not_to have_content('Book was successfully created.')
    end
    it 'does not show a flash notice when book creation fails due to negative price' do
        visit new_book_path
        fill_in 'Title', with: 'The Great Gatsby'
        fill_in 'Author', with: 'F. Scott Fitzgerald'
        fill_in 'Price', with: '-5.00'
        fill_in 'Date published', with: '1925-04-10'
        click_button 'Create Book'
        expect(page).not_to have_content('Book was successfully created.')
    end
    it 'does not show a flash notice when book creation fails due to future published_date' do
        visit new_book_path
        fill_in 'Title', with: 'The Great Gatsby'
        fill_in 'Author', with: 'F. Scott Fitzgerald'
        fill_in 'Price', with: '10.99'
        fill_in 'Date published', with: (Date.today + 1).to_s
        click_button 'Create Book'
        expect(page).not_to have_content('Book was successfully created.')
    end
end