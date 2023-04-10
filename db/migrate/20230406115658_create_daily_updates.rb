class CreateDailyUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_updates do |t|
      t.string :description
      t.string :project_name
      t.datetime :start_time
      t.datetime :end_time

      t.references :user,foreign_key: true
      t.references :organization,foreign_key: true
      t.timestamps
    end
  end
end
