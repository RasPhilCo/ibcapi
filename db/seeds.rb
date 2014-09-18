# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    #####
    # Used only for seeding videos from YT
    #####
    require 'youtube_it'
    SLEEP_TIME=12.0/24.0
    def get_vids
      client = YouTubeIt::Client.new(:dev_key => ENV['YT_KEY'])
      (1..500).each do |int|
        videos = client.videos_by(:query => "ice bucket challenge", :page => int, :per_page => 50)
        videos.videos.each do |video|
          v = Video.new
          v.title = video.title
          v.description = video.description
          v.yt_id_raw = video.video_id
          v.yt_id = video.video_id.split(':')[-1]
          v.player_url = video.player_url
          v.view_count = video.view_count
          v.popularity = Random.rand(1000..2000)
          begin
            v.favorite_count = video.rating.likes
          rescue
            v.favorite_count = 0
          end
          v.save!
          sleep(SLEEP_TIME)
        end
        sleep(1)
      end
    end

    get_vids