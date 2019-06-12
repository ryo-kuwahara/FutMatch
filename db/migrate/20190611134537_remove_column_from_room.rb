class RemoveColumnFromRoom < ActiveRecord::Migration[5.0]
  def change
    remove_column :rooms, :relation_id, :integer
  end
end
