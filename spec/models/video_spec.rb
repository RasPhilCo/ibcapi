require 'rails_helper'

describe Video do
  let(:video) { build(:video) }
  subject { build(:video) }

  it { should be_valid }

  describe "#count_vote" do
    context "when vote is up" do
      it "adds 1 to popularity" do
        expect { video.count_vote("up")} .to change {video.popularity }.by(1)
      end
    end

    context "when vote is down" do
      it "subtracts 1 from popularity" do
        expect { video.count_vote("down")} .to change {video.popularity }.by(-1)
      end
    end
  end
end

# let(:test_model) { build(:test_model) }
# subject { build(:test_model) }

# it { should be_valid }
# it { should validate_presence_of :name }
# it { should validate_uniqueness_of :name }

# describe "#average_cost" do
#   context "with no purchases" do
#     it "is nil" do
#       expect(test_model.average_cost).to be_nil
#     end
#   end

#   context "with one or more purchases" do
#     let(:test_model_with_purchases) { create_list(:test_model_with_purchases, purchase_count: 2, cost: 100) }

#     it "calculates the average purchase price properly" do
#       expect(test_model_with_purchases.average_cost).to eq(100)
#     end
#   end
# end