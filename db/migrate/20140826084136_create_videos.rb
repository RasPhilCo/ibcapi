class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :yt_id
      t.string :title
      t.string :description
      t.string :player_url
      t.integer :view_count
      t.integer :favorite_count

      t.timestamps
    end
  end
end
