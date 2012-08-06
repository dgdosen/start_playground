class Race < ActiveRecord::Base
  belongs_to :track
  attr_accessible :date, :day_evening_code, :is_day, :race_number, :track_code
end
