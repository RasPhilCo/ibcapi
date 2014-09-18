require 'rails_helper'

describe "Videos API" do
  describe "#index GET /api/v1/videos" do
    let!(:videos) { create_list(:video, 100) }

    context "with no params" do
      before { get "/api/v1/videos", {}, { "Accept" => "application/json" }}

      it "returns default value of 30 videos" do
        expect(response.status).to eq 200

        expect(json['results'].count).to eq(30)
      end
    end

    context "with params" do
      before { get "/api/v1/videos?page=2&per_page=40", {}, { "Accept" => "application/json" }}

      it "returns page 2" do
        expect(response.status).to eq 200

        expect(json['meta']['page']).to eq(2)
      end

      it "returns 40 videos per page" do
        expect(response.status).to eq 200

        expect(json['results'].count).to eq(40)
        expect(json['meta']['results_per_page']).to eq(40)
      end

      it "returns the custom title query" do
        create(:video, {:title => "Example title query" })
        get "/api/v1/videos?query=example", {}, { "Accept" => "application/json" }

        expect(json['results'].first['title']).to eq("Example title query")
      end
    end
  end


  describe "#show GET /video/:yt_id" do
    let(:video) { create(:video) }

    it "retrieves a specific video" do   
      get "/api/v1/videos/#{video.yt_id}"

      expect(response.status).to eq 200
      expect(json["yt_id"]).to eq(video.yt_id) 
      expect(json["title"]).to eq(video.title) 
      expect(json["description"]).to eq(video.description) 
      expect(json["player_url"]).to eq(video.player_url) 
      expect(json["view_count"]).to eq(video.view_count) 
      expect(json["favorite_count"]).to eq(video.favorite_count) 
      expect(json["popularity"]).to eq(video.popularity) 
      expect(json["url"]).to eq(api_v1_video_url(video.yt_id)) 
     
      # non-exposed attributes
      expect(json['id']).to eq(nil)
      expect(json['created_at']).to eq(nil)
      expect(json['updated_at']).to eq(nil)
      expect(json['duplicate']).to eq(nil)
    end
  end

  describe "#show PUT /video/:yt_id" do
    let!(:video) { create(:video) }
    
    context "when voting up" do
      it "should increase popularity by 1" do
        put "/api/v1/videos/#{video.yt_id}", {vote: "up"}, { "Accept" => "application/json" }

        expect(response.status).to eq 200
        expect(json["popularity"]).to eq(video.popularity += 1)
      end
    end

    context "when voting down" do
      it "should decrease popularity by 1" do
        put "/api/v1/videos/#{video.yt_id}", {vote: "down"}, { "Accept" => "application/json" }

        expect(response.status).to eq 200
        expect(json["popularity"]).to eq(video.popularity -= 1)
      end
    end

    context "when vote is an illegal param" do
      it "should return 422" do
        put "/api/v1/videos/#{video.yt_id}", {vote: "illegal"}, { "Accept" => "application/json" }
        expect(response.status).to eq 422
      end
    end
  end
end
