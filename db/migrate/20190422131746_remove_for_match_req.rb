class RemoveForMatchReq < ActiveRecord::Migration[5.0]
  def change
    remove_column :match_reqs, :begin_time, :string
    remove_column :match_reqs, :finish_time, :string
  end
end
