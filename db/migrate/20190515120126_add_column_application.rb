class AddColumnApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :match_req_id, :integer
    add_column :applications, :team_id, :integer
    add_column :applications, :status, :string
  end
end
