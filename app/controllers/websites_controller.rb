# frozen_string_literal: true

class WebsitesController < ApplicationController
  before_action :set_website, only: %i[edit update destroy]
  before_action :check_is_admin?, only: %i[new edit create update destroy]

  # GET /websites
  # GET /websites.json
  def index
    @websites = Website.all
  end

  # GET /websites/1
  # GET /websites/1.json
  def show
    @website = Website.find_by(title: params[:title])
  end

  # GET /websites/new
  def new
    @website = Website.new
  end

  # GET /websites/1/edit
  def edit; end

  # POST /websites
  # POST /websites.json
  def create
    @website = Website.new(website_params.except(:stacks))

    respond_to do |format|
      if @website.save
        add_stacks(website_params)
        # ContactMailer.with(user: @user).contact_me.deliver_now
        format.html { redirect_to websites_path, notice: 'Website was successfully created.' }
        format.json { render :show, status: :created, location: @website }
      else
        format.html { render :new }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /websites/1
  # PATCH/PUT /websites/1.json
  def update
    respond_to do |format|
      if @website.update(website_params.except(:stacks))
        add_stacks(website_params)
        format.html { redirect_to websites_path, notice: 'Website was successfully updated.' }
        format.json { render :show, status: :ok, location: @website }
      else
        format.html { render :edit }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website.stacks.clear
    @website.destroy
    respond_to do |format|
      format.html { redirect_to websites_url, notice: 'Website was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_website
    @website = Website.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def website_params
    params.require(:website).permit(:title, :description, :url, :code, :image, stacks: [])
  end

  def add_stacks(website_params)
    @website.stacks.clear
    @array = []
    website_params.slice(:stacks).values.flatten.each do |stack_name|
      @array << stack_name unless stack_name.empty?
    end
    @stacks = Stack.all # eager_load(:tracktions)
    @array.size.times do |xyz|
      @website.stacks << @stacks.find_by(name: @array[xyz])
    end
  end
end
