class CreateTeamSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :team_seasons do |t|
      t.string :season
      t.string :team_city
      t.string :team_name
      t.string :team_color
      t.integer :salary
      t.integer :wins
      t.integer :losses
      t.float :win_percentage

      t.timestamps
    end
  end
end
