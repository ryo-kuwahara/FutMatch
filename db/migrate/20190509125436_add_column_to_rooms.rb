class AddColumnToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :name, :string, default: "新規チャット"
    add_column :rooms, :explain, :text
  end
end
