class CreateTeamSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :team_seasons do |t|
      t.string :season
      t.string :team_city
      t.string :team_name
      t.integer :salary
      t.integer :wins
      t.integer :losses
      t.integer :float

      t.timestamps
    end
  end
end
