class CreateMatchReqs < ActiveRecord::Migration[5.0]
  def change
    create_table :match_reqs do |t|
      t.integer :team_id
      t.string :title
      t.text :content
      t.date :match_date
      t.time :start_time
      t.time :end_time
      t.string :facility
      t.integer :req_team_num
      t.timestamps
    end
  end
end
