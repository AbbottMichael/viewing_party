class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :viewing_time
      t.integer :movie_id
      t.references :host, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
