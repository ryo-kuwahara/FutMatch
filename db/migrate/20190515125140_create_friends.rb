class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.string :status

      t.timestamps
    end
  end
end
