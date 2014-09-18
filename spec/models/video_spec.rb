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