class CreateActivityLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_logs do |t|
      t.integer :baby_id
      t.integer :assistant_id
      t.integer :activity_id
      t.datetime :start_time
      t.datetime :stop_time
      t.integer :duration
      t.text :comments

      t.timestamps
    end
  end
end
