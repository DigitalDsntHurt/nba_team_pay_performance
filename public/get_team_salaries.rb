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

CSV.open("/Users/Graphiq-NS/Desktop/d3/nba_team_pay_performance/public/team_salaries.csv","w+") do |new_sheet|
	headers = ["Year","Team","Total Salaries","Total Salaries (Cap/Tax)"]
	new_sheet << headers

	base = "http://www.spotrac.com/nba/"

	target = []
	@csv = CSV.open("/Users/Graphiq-NS/Desktop/latest_nba/nba_fantasy/lib/data/team_years.csv","r").to_a
	@csv[1..-1].each{|row|
		next if row[0].include?("-17")
		@u = base + row[1].downcase.gsub(" ","-") + "/cap/" + row[0][0..1] + row[0][-2..-1] + "/"
		@x = "//table[contains(@class, 'captotal')]/tbody/tr/td"
		p @u
		@results = get_stuff_from_page(@u,@x)#.reject{|item| item == "-" }
		
		@temp = []
		2.times do
			@index = @results.index{|item| item.include?("Total Salaries") }
			break if @index == nil
			@temp << [ @results[@index], @results[@index+1] ]
			@results.delete_at(@index)
			@results.delete_at(@index)
		end
		
		@row = []
		@row << row[0][0..1] + row[0][-2..-1]
		@row << row[1]
		@temp.each{|oarr| 
			@row << oarr[1][1..-1].gsub(",","").to_i
			#p oarr[1][1..-1].gsub(",","").to_i
		}
		new_sheet << @row
		puts @row
		puts ""
		puts "\n*\n"
	}




end
=begin
=end