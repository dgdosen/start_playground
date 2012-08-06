class Start < ActiveRecord::Base
  belongs_to :race
  belongs_to :horse
  belongs_to :trainer
  belongs_to :jockey
  belongs_to :owner
  attr_accessible :is_scratched, :post_position, :program_number
end
