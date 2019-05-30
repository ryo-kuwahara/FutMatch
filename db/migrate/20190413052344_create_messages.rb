class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :team_id
      t.integer :room_id
      t.string :message
      t.timestamps
    end
  end
end
