# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
require 'find'

$IMPORT_LOCATION = "#{Rails.root}/db/import_test"

Horse.delete_all
Race.delete_all
Start.delete_all

User.create! name: 'ray', an_code: 'rayb', initials: 'rb',
             email: 'rayb@seattlespineinstitute.com', category_id: 1,
             state_id: 1, password: 'secure'


#puts "adding tracks..."
#Track.delete_all
#open("#{Rails.root}/db/scoreboard/Tracks.csv") do |tracks|
#   tracks.each_line do |track|
#     track_id, an_code, name, location_id, state_location_id, category_id = track.chomp.split(",")
#     new_track= Track.find_or_create_by_track_code(
#         an_code,
#       :id => track_id,
#       #:location_id => location_id,
#       :name => name)
#     new_track.save
#   end
#end

#Find.find("#{$IMPORT_LOCATION}/bris_results") do |f|
#  case File.extname(f)
#    when ".1"
#
#      csv_text = File.read(f)
#      csv = CSV.parse(csv_text)
#      puts "adding race data for " + File.basename(f, ".1") + "..."
#
#      csv.each do |row|
#        new_race = Race.find_or_create_by_track_code_and_race_number_and_date(
#          row[0], row[2], Date.iso8601(row[1]))
#
#        new_race.update_attributes(
#          :race_number => row[2],
#          :day_evening_code => (row[3] if row[3]),
#          :is_day => (true if (row[3] == "D")),
#        )
#
#      end
#
#    when ".2"
#
#      csv_text = File.read(f)
#      csv = CSV.parse(csv_text)
#
#      csv.each do |row|
#
#        if row[4]
#          start_horse = Horse.find_or_create_by_name(
#            row[4].split("(").first.rstrip.upcase,
#            :foreign_bred_code => (row[5] if row[5]),
#            :state_bred_code => (row[6] if row[6]),
#            :year_of_birth => (row[9] if row[9]),
#          )
#          start_horse.save
#        end
#
#        race = Race.find_by_track_code_and_race_number_and_date(row[0],
#                                                                row[2],
#                                                                Date.iso8601(row[1]))
#        start = Start.find_or_create_by_race_id_and_horse_id(
#          race.id, start_horse.id
#        )
#
#        start.update_attributes(
#          :post_position=> (row[7] if row[7]),
#          :program_number=> (row[8] if row[8]),
#        )
#
#      end
#  end
#end
