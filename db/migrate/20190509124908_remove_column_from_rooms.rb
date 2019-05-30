class RemoveColumnFromRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :relation_id, :integer
    remove_column :rooms, :match_req_id, :integer
  end
end
