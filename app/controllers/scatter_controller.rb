class ScatterController < ApplicationController
	
	require 'csv'
	def index
	@team_seasons = TeamSeason.all
	end


	def graph
	    @csv = CSV.open(Rails.root.join('app', 'views', 'team_seasons', '2016-17.csv'),"r").to_a
	    @json = {"chartType": "Scatterplot", "attribute1" => "x", "attribute2" => "y", "data" => []}

	    @csv.each_with_index{|row,i|
	      next if i == 0
	      @hsh = {}
	      @hsh["x"] = row[6]
	      @hsh["y"] = row[3]
	      @json["data"] << @hsh
	    }

	    render json: @json
	end

	def scatterchart
		@csv = CSV.open(Rails.root.join('lib', 'data', '2016-17.csv'),"r").to_a
		@json = []

		@csv.sort_by{|row| row[5] }.each_with_index{|row,i|
		  next if i == 0
		  @hsh = {}
		  @hsh["team_name"] = row[2]
		  @hsh["team_color"] = row[3]
		  @hsh["salary"] = row[4]
		  @hsh["wins"] = row[5]
		  @json << @hsh
		}

		render json: @json
	end

end
