class AddColumnToFacrilty < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :address, :string
    add_column :facilities, :tel, :string
    add_column :facilities, :image, :string
    rename_column :facilities, :facility, :name
  end
end
