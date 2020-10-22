# frozen_string_literal: true

class AppsController < ApplicationController
  before_action :set_app, only: %i[edit update destroy]
  before_action :check_is_admin?, only: %i[new edit create update destroy]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.all
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @app = App.find_by(title: params[:title])
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit; end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params.except(:stacks))

    respond_to do |format|
      if @app.save
        add_stacks(app_params)
        format.html { redirect_to apps_path, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    respond_to do |format|
      if @app.update(app_params.except(:stacks))
        add_stacks(app_params)
        format.html { redirect_to apps_path, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.stacks.clear
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_app
    @app = App.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def app_params
    params.require(:app).permit(:title, :description, :mobile_description, :url, :code, :image, stacks: [])
  end

  def add_stacks(app_params)
    @app.stacks.clear
    @array = []
    app_params.slice(:stacks).values.flatten.each do |stack_name|
      @array << stack_name unless stack_name.empty?
    end
    @stacks = Stack.all # eager_load(:tracktions)
    @array.size.times do |xyz|
      @app.stacks << @stacks.find_by(name: @array[xyz])
    end
  end
end
