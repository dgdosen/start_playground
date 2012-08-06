class ModifyMovie < ActiveRecord::Migration
  def change
    add_column :movies, :race_id, :integer
    add_column :movies, :post_position, :integer
    add_column :movies, :program_number, :string
    add_column :movies, :is_scratched, :boolean
    add_column :movies, :is_tongue_tied, :boolean
  end

end
