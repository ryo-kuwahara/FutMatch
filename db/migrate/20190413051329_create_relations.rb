class CreateRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :relations do |t|
      t.integer :receive_team_id
      t.integer :request_team_id
      t.string :comment
      t.timestamps
    end
  end
end
