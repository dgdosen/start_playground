class CreateStarts < ActiveRecord::Migration
  def change
    create_table :starts do |t|
      t.references :race
      t.references :horse
      t.references :trainer
      t.references :jockey
      t.references :owner
      t.integer :post_position
      t.string :program_number
      t.boolean :is_scratched

      t.timestamps
    end
    add_index :starts, :race_id
    add_index :starts, :horse_id
    add_index :starts, :trainer_id
    add_index :starts, :jockey_id
    add_index :starts, :owner_id
  end
end
