json.extract! video, :yt_id, :title, :description, :player_url, :view_count, :favorite_count, :popularity
json.url api_v1_video_url(video.yt_id)
