require 'rest-client'
require 'nokogiri'
require 'date'
require 'csv'

def get_stuff_from_page(page,xpath)
	begin
	  request = RestClient::Resource.new(page, :verify_ssl => false).get
	rescue RestClient::NotFound => not_found
	  return not_found
	rescue 
	  return nil
	else
	  	payload = []
	  	Nokogiri::HTML(request).xpath(xpath).map{|item|
			payload << item.text.strip if item != nil
		}
		return payload
	end
end

base = "http://www.basketball-reference.com"

team_years = CSV.open("/Users/Graphiq-NS/Desktop/d3/nba_team_pay_performance/public/team_years_public.csv","r").to_a
salaries = CSV.open("/Users/Graphiq-NS/Desktop/d3/nba_team_pay_performance/public/team-salaries_public.csv","r").to_a
colors = CSV.open("/Users/Graphiq-NS/Desktop/d3/nba_team_pay_performance/public/2016-17_colors_public.csv","r").to_a

unique_years = []
team_years.each{|tyrow|
	unique_years << tyrow[0][0..1] + tyrow[0][-2..-1]
}
unique_years.uniq!
unique_years.delete_at(0)
unique_years.delete_at(0)


payload = []
unique_years.each{|year|
	
	@salaries_for_year = salaries.select{|salary_row| salary_row[0] == year }.sort_by{|salary_row| salary_row[1]  }
	@team_years_for_year = team_years.select{|team_year_row| team_year_row[0][0..1] + team_year_row[0][-2..-1] == year }.sort_by{|team_year_row| team_year_row[1]  }
	@team_years_for_year.zip(@salaries_for_year).each{|pair|
		@new_row = pair[0]
		if pair[1][-1] == pair[1][-2] or pair[1][-1] > pair[1][-2]
			@use_salary = pair[1][-1]
		else
			@use_salary = pair[1][-2]
		end
		payload << @new_row.insert(5,@use_salary)
	}
}

axeit = []
colors.each{|color_row|
	next if color_row[0] == "season"

	@team_match = payload.select{|payload_row| payload_row[1] == color_row[3] }
	if @team_match.count == 7
		@team_match.each{|old_row|
			axeit << old_row.insert(6,color_row[4])
		}
		puts ""
	else
		if color_row[3].include?("Charlotte Hornets")
			@team_match.each{|old_row|
				axeit << old_row.insert(6,color_row[4])
			}
			@team_match = payload.select{|payload_row| payload_row[1].include?("Bobcats") }
			@team_match.each{|old_row|
				axeit << old_row.insert(6,color_row[4])
			}
			puts ""
		elsif color_row[3].include?("New Orleans Pelicans")
			@team_match.each{|old_row|
				axeit << old_row.insert(6,color_row[4])
			}
			@team_match = payload.select{|payload_row| payload_row[1].include?("New Orleans Hornets") }
			@team_match.each{|old_row|
				axeit << old_row.insert(6,color_row[4])
			}
			puts ""
		elsif color_row[3].include?("Nets")
			@team_match.each{|old_row|
				axeit << old_row.insert(6,color_row[4])
			}
			@team_match = payload.select{|payload_row| payload_row[1].include?("New Jersey Nets") }
			@team_match.each{|old_row|
				axeit << old_row.insert(6,color_row[4])
			}
			puts ""
		else
			puts "\n***\nSomething fucked up\n***\n"
		end
	end
}

CSV.open("/Users/Graphiq-NS/Desktop/d3/nba_team_pay_performance/public/teamyears-and-salaries_public.csv","w+") do |payload|
	payload << ["season","team","wins","losses","win_percentage","salary","color","offensive_rating","defensive_rating","season_outcome","teamseason_url","team_url"]
	axeit.each{|row|
		payload << row
	}
end

#	
#

#payload.each{|r|
#	p r
#	puts 
#}

#puts payload.count


