class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :follower, references: :users, foreign_key: { to_table: :users }
      t.references :followed, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
