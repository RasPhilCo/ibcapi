class AddPopularityToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :popularity, :integer
  end
end
