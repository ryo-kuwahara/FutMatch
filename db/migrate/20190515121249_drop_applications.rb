class DropApplications < ActiveRecord::Migration[5.0]
  def change
    drop_table :applications
  end
end
