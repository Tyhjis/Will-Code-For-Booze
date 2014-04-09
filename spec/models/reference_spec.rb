  require 'spec_helper'

describe Reference do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "generates scands correctly" do
        ref = Reference.new author:"ÄäliöåÅÖ"
        str = ref.generate_scands(ref.author)
        str.should == '\"{A}\"{a}li\"{o}\"aa\"AA\"{O}'
  end

  it "returns correct bibtex string" do
        ref = Reference.new key:'erkki', referencetype:'inproceedings', author:'First Author and Second Author', title:'Some publication title', booktitle:'lol', year:1653
        str = ref.to_bib_str
        str.should == '@INPROCEEDINGS{erkki, author = {First Author and Second Author}, title = {Some publication title}, booktitle = {lol}, year = {1653}'
  end

  it "validates the required field key" do
        ref = Reference.create referencetype:'inproceedings', author:'Erkki Hervanta', title:'Boozeman journal'
        expect(ref.valid?).to be(false)
  end

  it "validates the required field referencetype" do
        ref = Reference.create key:'erkki', author:'jykä käteinen'
        expect(ref.valid?).to be(false)
  end
end


#@INPROCEEDINGS {author:06,
# title    = {Some publication title},
# author   = {First Author and Second Author},
# crossref = {conference:06},
# pages    = {330--331},
#}
