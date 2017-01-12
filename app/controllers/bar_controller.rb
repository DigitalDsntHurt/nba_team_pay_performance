class BarController < ApplicationController
  
  require 'csv'
  
  def index
    @team_seasons = TeamSeason.all
  end


	def json
	    @csv = CSV.open(Rails.root.join('lib', 'data', '2016-17.csv'),"r").to_a.sort_by{|arr| arr[5].to_i}
	    @json = []

	    @csv.each_with_index{|row,i|
	      next if i == 0
	      next if row[2] == "team_name"
	      @hsh = {}
	      @hsh["team_name"] = row[2]
	      @hsh["team_color"] = row[3]
	      @hsh["salary"] = row[4]
	      @hsh["wins"] = row[5]
	      @json << @hsh
	    }

	    render json: @json
	end

#	def csv
#	    @csv = CSV.open(Rails.root.join('lib', 'data', '2016-17.csv'),"r").to_a.sort_by{|arr| arr[5].to_i}
#	    render csv: @csv
#	end

end
