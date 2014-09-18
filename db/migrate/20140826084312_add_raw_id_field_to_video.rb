class AddRawIdFieldToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :yt_id_raw, :integer
  end
end
