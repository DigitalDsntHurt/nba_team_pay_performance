
require 'csv' 


=begin

CSV.open(Rails.root.join('lib', 'data', '.csv'),"r").to_a.each_with_index{|row,i|
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
=end


salaries = CSV.open(Rails.root.join('public', 'team_salaries.csv'),"r").to_a
teams = CSV.open(Rails.root.join('public', '2016-17_public.csv'),"r").to_a


salaries.each_with_index{|salary_row,i|
    next if salary_row[0].include?("Year")
    next if salary_row[0].include?("17")
    @year_match = teams.select{|team_row| team_row[0][-2..-1] == salary_row[0][-2..-1] }
    @team_match = @year_match.select{|team_row| team_row[1] == salary_row[1]}

    p salary_row[0][-2..-1]
    p teams[i]#[0]
    #p @team_match.count
    puts
}

=begin
target = CSV.open(Rails.root.join('public','2016-17-w-salaries_public.csv'),"w+")
target do |new_sheet|

    @new_row = []



    new_sheet << @new_row
end
=end