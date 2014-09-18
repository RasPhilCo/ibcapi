class ChangeYtidrawTypeToString < ActiveRecord::Migration
  def change
    change_column :videos, :yt_id_raw, :string
  end
end
