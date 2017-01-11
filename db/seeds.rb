# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.open(Rails.root.join('lib', 'seeds', '2016-17.csv'),"r").to_a.each_with_index{|row,i|
	next if i == 0
	TeamSeason.create( 
		:season => row[0],
		:team_city => row[1],
    	:team_name => row[2],
    	:salary => row[3],
    	:wins => row[4],
    	:losses => row[5],
    	:float => row[6]
      )
}
 