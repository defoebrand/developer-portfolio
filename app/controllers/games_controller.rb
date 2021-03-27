class GamesController < ApplicationController
  before_action :set_game, only: %i[edit update destroy]
  before_action :check_is_admin?, only: %i[new edit create update destroy]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(title: params[:title])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params.except(:stacks))

    respond_to do |format|
      if @game.save
        add_stacks(game_params)
        format.html { redirect_to games_path, notice: 'Game was successfully created.' }
        format.json { render :index, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @game.update(game_params.except(:stacks))
        add_stacks(game_params)
        format.html { redirect_to games_path, notice: 'Game was successfully updated.' }
        format.json { render :index, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game.stacks.clear
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :mobile_description, :url, :image, :code, stacks: [])
  end

  def add_stacks(game_params)
    @game.stacks.clear
    @array = []
    game_params.slice(:stacks).values.flatten.each do |stack_name|
      @array << stack_name unless stack_name.empty?
    end
    @stacks = Stack.all
    @array.size.times do |xyz|
      @game.stacks << @stacks.find_by(name: @array[xyz])
    end
  end
end
