require 'spec_helper'

class ReferenceTest < ActiveSupport::TestCase
  
  # test "the truth" do
  #   assert true
  # end
  describe Reference do
    it "generates scands correctly" do
        ref = Reference.new author:"ÄäliöåÅÖ"
        str = ref.generate_scands(ref.author)
        str.should == '\"{A}\"{a}li\"{o}\{aa}\{AA}\"{O}'
    end

  end
end
