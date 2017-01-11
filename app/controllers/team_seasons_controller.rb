class TeamSeasonsController < ApplicationController
  before_action :set_team_season, only: [:show, :edit, :update, :destroy]

  # GET /team_seasons
  # GET /team_seasons.json
  require 'csv'
  def index
    @team_seasons = TeamSeason.all
    @rows = []
    @csv = CSV.open(Rails.root.join('app', 'views', 'team_seasons', '2016-17.csv'),"r")
    @json = {"chartType": "Scatterplot", "attribute1" => "x", "attribute2" => "y", "data" => []}

    @csv.each{|row|
      @hsh = {}
      @hsh["x"] = row[6]
      @hsh["y"] = row[3]
      @json["data"] << @hsh
    }

    #@csvv = Rails.root.join('app', 'views', 'team_seasons', '2016-17.csv')
    #.to_a.each{|row|
    #  @rows << row
    #}
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

  # GET /team_seasons/1
  # GET /team_seasons/1.json
  def show
  end

  # GET /team_seasons/new
  def new
    @team_season = TeamSeason.new
  end

  # GET /team_seasons/1/edit
  def edit
  end

  # POST /team_seasons
  # POST /team_seasons.json
  def create
    @team_season = TeamSeason.new(team_season_params)

    respond_to do |format|
      if @team_season.save
        format.html { redirect_to @team_season, notice: 'Team season was successfully created.' }
        format.json { render :show, status: :created, location: @team_season }
      else
        format.html { render :new }
        format.json { render json: @team_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_seasons/1
  # PATCH/PUT /team_seasons/1.json
  def update
    respond_to do |format|
      if @team_season.update(team_season_params)
        format.html { redirect_to @team_season, notice: 'Team season was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_season }
      else
        format.html { render :edit }
        format.json { render json: @team_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_seasons/1
  # DELETE /team_seasons/1.json
  def destroy
    @team_season.destroy
    respond_to do |format|
      format.html { redirect_to team_seasons_url, notice: 'Team season was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_season
      @team_season = TeamSeason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_season_params
      params.require(:team_season).permit(:index)
    end
end
