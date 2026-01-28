
require 'rails_helper'
RSpec.describe Book, type: :model do
  it 'is valid with a title, author, price, and published_date' do
    book = Book.new(title: 'Sample Book', author: 'Sample Author', price: 19.99, published_date: Date.new(2020,1,1))
    expect(book).to be_valid
  end
  it 'is invalid without a title' do
    book = Book.new(title: '', author: 'Sample Author', price: 19.99, published_date: Date.new(2020,1,1))
    expect(book).not_to be_valid
  end
  it 'is invalid without an author' do
    book = Book.new(title: 'Sample Book', author: '', price: 19.99, published_date: Date.new(2020,1,1))
    expect(book).not_to be_valid
  end
  it 'is invalid with negative price' do
    book = Book.new(title: 'Sample Book', author: 'Sample Author', price: -10, published_date: Date.new(2020,1,1))
    expect(book).not_to be_valid
  end
  it 'is invalid with a future published_date' do
    book = Book.new(title: 'Sample Book', author: 'Sample Author', price: 19.99, published_date: Date.today + 1)
    expect(book).not_to be_valid
  end
end