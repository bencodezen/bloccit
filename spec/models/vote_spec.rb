require 'rails_helper'

describe Vote do
  describe "validations" do
    descrive "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @vote.down_vote ).to eq(1)
        expect( @vote.up_vote ).to eq(-1)
      end
    end
  end
end

end