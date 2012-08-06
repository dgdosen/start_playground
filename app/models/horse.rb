class Horse < ActiveRecord::Base
  attr_accessible :bred_location_id, :foreign_bred_code, :name, :state_bred_code, :state_bred_location_id, :year_of_birth
end
