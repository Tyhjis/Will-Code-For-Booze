require 'spec_helper'

describe Book do

  after :each do
    DatabaseCleaner.clean
  end

  it "validates column author" do
    b = Book.create year:1950, referencetype:'book', key:'ass', title:'boozeman journal', publisher:'HY'
    expect(b.valid?).to be(false)
  end

  it "validates column title" do
    b = Book.create year:1950, referencetype:'book', key:'ass', author:'erkki hervanta', publisher:'HY'
    expect(b.valid?).to be(false)
  end

  it "validates column publisher" do
    b = Book.create year:1950, referencetype:'book', key:'ass', author:'erkki hervanta', title:'boozeman journal'
    expect(b.valid?).to be(false)
  end

  it "adds a new book to table with columns validated correctly" do
    b = Book.create year:1950, referencetype:'book', key:'nössö', author:'erkki hervanta', title:'boozeman journal', publisher:'HY'
    expect(b.valid?).to be(true)
    expect(Book.count).to eq(1)
  end
end
