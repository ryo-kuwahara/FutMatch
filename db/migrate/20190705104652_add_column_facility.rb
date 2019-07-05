class AddColumnFacility < ActiveRecord::Migration[5.0]
  def change
    rename_column :match_reqs, :facility, :facility_id
  end
end
