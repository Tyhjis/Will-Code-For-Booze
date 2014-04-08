require 'spec_helper'

describe Article do

  #author title journal year

  it "is not saved if required field year not present" do
    article = Article.create author:"Author", title:"Title", journal:"journal title"
    expect(article).not_to be_valid
  end

  it "is not saved if required field journal not present" do
    article = Article.create author:"Author", title:"Title", year:1990
    expect(article).not_to be_valid
  end

  it "is not saved if required field title not present" do
    article = Article.create author:"Author", journal:"journal title", year:1990
    expect(article).not_to be_valid
  end

  it "is not saved if required field author not present" do
    article = Article.create title:"Title", journal:"journal title", year:1990
    expect(article).not_to be_valid
  end

  it "is saved if all required fields present" do
    article = Article.create author:"Author", title:"Title", journal:"journal title", year:1990
    expect(article).to be_valid
  end

  it "is saved with all given fields" do
    article = Article.create author:"Author", title:"Title", journal:"journal title", year:1990, publisher:"Jaska", note:"olen ihana"
    expect(article).to be_valid

    expect(article.note).to eq("olen ihana")
    expect(article.publisher).to eq("Jaska")

  end

end