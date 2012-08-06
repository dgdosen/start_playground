class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :foreign_bred_code
      t.integer :bred_location_id
      t.string :state_bred_code
      t.integer :state_bred_location_id
      t.integer :year_of_birth

      t.timestamps
    end
    add_index :horses, :name
  end
end
