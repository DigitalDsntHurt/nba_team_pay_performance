# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.open(Rails.root.join('lib', 'data', '2016-17.csv'),"r").to_a.each_with_index{|row,i|
	next if i == 0
	TeamSeason.create( 
		:season => row[0],
		:team_city => row[1],
    	:team_name => row[2],
        :team_color => row[3],
    	:salary => row[4],
    	:wins => row[5],
    	:losses => row[6],
    	:win_percentage => row[7]
      )
}
 