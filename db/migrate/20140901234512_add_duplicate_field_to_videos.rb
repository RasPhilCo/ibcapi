class AddDuplicateFieldToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :duplicate, :boolean
  end
end
