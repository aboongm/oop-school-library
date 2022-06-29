require_relative '../book'

describe 'Book' do
  before(:each) do
    @book = Book.new('Harry Potter', 'J.K Rowling')
  end

  it 'Should take the title and author' do
    expect(@book.title).to eq('Harry Potter')
    expect(@book.title).not_to eq('Harry Potters')
    expect(@book.author).to eq('J.K Rowling')
    expect(@book.author).not_to eq('JK Rowling')
  end

  it 'Should take the title and author' do
    new_book = Book.new('The Lords Of The Rings', 'Tolkien')
    expect(new_book.title).to eq('The Lords Of The Rings')
    expect(new_book.title).not_to eq('The Lord Of The Ring')
    expect(new_book.author).to eq('Tolkien')
    expect(new_book.author).not_to eq('Tolkiens')
  end
end
