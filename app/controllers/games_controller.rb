class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show; end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit; end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params.except(:stacks))

    respond_to do |format|
      if @game.save
        add_stacks(website_params)
        format.html { redirect_to games_path, notice: 'Game was successfully created.' }
        format.json { render :index, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params.except(:stacks))
        add_stacks(website_params)
        format.html { redirect_to games_path, notice: 'Game was successfully updated.' }
        format.json { render :index, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.stacks.clear
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:title, :description, :url, :image, :code, stacks: [])
  end

  def add_stacks(game_params)
    @game.stacks.clear
    @array = []
    game_params.slice(:stacks).values.flatten.each do |stack_name|
      @array << stack_name unless stack_name.empty?
    end
    @stacks = Stack.all # eager_load(:tracktions)
    @array.size.times do |xyz|
      @game.stacks << @stacks.find_by(name: @array[xyz])
    end
  end
end
