class ChangeMatchReqs < ActiveRecord::Migration[5.0]
  def change
    remove_column :match_reqs, :facility, :string
    add_column :match_reqs, :facility_id, :integer
  end
end
