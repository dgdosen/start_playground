class AddTongueTied < ActiveRecord::Migration
  def change
    add_column :starts, :is_tongue_tied, :boolean
  end

end
