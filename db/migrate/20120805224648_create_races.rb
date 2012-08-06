class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.references :track
      t.string :track_code
      t.date :date
      t.integer :race_number
      t.string :day_evening_code
      t.boolean :is_day

      t.timestamps
    end
    add_index :races, :track_id
    add_index :races, :track_code
    add_index :races, :date
    add_index :races, :race_number
  end
end
