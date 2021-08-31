class AddDateTimeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :date_time, :timestamp
  end
end
