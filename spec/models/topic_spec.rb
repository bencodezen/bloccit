require 'rails_helper'

describe Topic do
  describe "scopes" do

    before do
      @public_topic = Topic.create!(name: 'Public Topic Name', description: 'This is my topic description')
      @private_topic = Topic.create!(name: 'Private Topic Name', description: 'This is my topic description', public: false)
    end

    describe "publicly_viewable" do
      it "returns a relation of all public topics" do
        expect(Topic.publicly_viewable).to eq( [@public_topic] )
      end
    end

    describe "privately_viewable" do
      it "returns a relation of all private topics" do
        expect(Topic.privately_viewable).to eq( [@public_topic, @private_topic] )
      end
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = true
        expect( Topic.visible_to(user) ).to eq( [@public_topic, @private_topic] )
      end

      it "returns only public topics if user is nil" do
        expect( Topic.visible_to(nil) ).to eq( [@public_topic] )
      end
    end
  end  
end