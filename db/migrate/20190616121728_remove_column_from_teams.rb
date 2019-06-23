class RemoveColumnFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :facility,:string
    add_column :teams, :facility_id, :integer
  end
end
