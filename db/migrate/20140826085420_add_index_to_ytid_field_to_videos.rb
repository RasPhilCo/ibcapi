class AddIndexToYtidFieldToVideos < ActiveRecord::Migration
  def change
    add_index :videos, :yt_id
  end
end
