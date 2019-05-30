class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.integer :match_req_id
      t.integer :team_id
      t.string :status

      t.timestamps
    end
  end
end
