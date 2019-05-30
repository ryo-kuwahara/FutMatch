class AddColumnMatchreq < ActiveRecord::Migration[5.0]
  def change
    add_column :match_reqs, :begin_time, :string
    add_column :match_reqs, :finish_time, :string
    
    
  end
end
