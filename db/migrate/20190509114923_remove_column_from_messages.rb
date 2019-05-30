class RemoveColumnFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :room_id, :integer
  end
end
