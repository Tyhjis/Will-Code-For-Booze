require 'spec_helper'

describe Inproceeding do

  it "is not saved if required field year not present" do
    inproceeding = Inproceeding.create author:"Author", title:"Title", booktitle:"Booktitle", referencetype:"inproceeding", key:"thekey"
    expect(inproceeding).not_to be_valid
  end

  it "is not saved if required field booktitle not present" do
    inproceeding = Inproceeding.create author:"Author", title:"Title", year:1990, referencetype:"inproceeding", key:"thekey"
    expect(inproceeding).not_to be_valid
  end

  it "is not saved if required field title not present" do
    inproceeding = Inproceeding.create author:"Author", booktitle:"Booktitle", year:1990, referencetype:"inproceeding", key:"thekey"
    expect(inproceeding).not_to be_valid
  end

  it "is not saved if required field author not present" do
    inproceeding = Inproceeding.create title:"Title", booktitle:"Booktitle", year:1990, referencetype:"inproceeding", key:"thekey"
    expect(inproceeding).not_to be_valid
  end

  it "is not saved if required field referencetype not present" do
    inproceeding = Inproceeding.create author:"Author", title:"Title", booktitle:"Booktitle", year:1990, key:"thekey"
    expect(inproceeding).not_to be_valid
  end

  it "is saved if all required fields present" do
    inproceeding = Inproceeding.create author:"Author", title:"Title", booktitle:"Booktitle", year:1990, referencetype:"inproceeding", key:"thekey"
    expect(inproceeding).to be_valid
  end

  it "is saved with all given fields" do
    inproceeding = Inproceeding.create author:"Author", title:"Title", booktitle:"Booktitle", year:1990, publisher:"Jaska",
                                       note:"olen ihana", referencetype:"inproceeding", key:"thekey"
    expect(inproceeding).to be_valid

    expect(inproceeding.note).to eq("olen ihana")
    expect(inproceeding.publisher).to eq("Jaska")

  end

end


#it "is saved with a proper name and style" do
#  style = Style.create name:"Lager", description:"N/A"
#  beer = Beer.create name:"Joku IPA", style:style
#
#  expect(beer).to be_valid
#  expect(Beer.count).to eq(1)
#end
