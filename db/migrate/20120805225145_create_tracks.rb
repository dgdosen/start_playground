class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_code
      t.string :name

      t.timestamps
    end
  end
end
