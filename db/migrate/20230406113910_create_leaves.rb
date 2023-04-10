class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.integer :leave_type
      t.string :description
      t.datetime :from_date
      t.datetime :to_date
      t.integer :status, default: 0

      t.references :user,foreign_key: true
      t.references :organization,foreign_key: true
      t.timestamps
    end
  end
end
