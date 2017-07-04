class StylistsController < ApplicationController
  before_action :set_stylist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]

  # GET /stylists
  # GET /stylists.json

  def index
    @stylists = Stylist.all
  end

  # GET /stylists/1
  # GET /stylists/1.json
  def show
  end

  def get_branches
    @salon = Salon.find(params[:id])
    @branches = @salon.branches
    return render partial: "branches", locals: { :@branches => @branches }
  end

  def get_service_categories
    @branch = Branch.find(params[:id])
    @service_categories = @branch.service_categories
    return render partial: "service_categories", locals: { :@service_categories => @service_categories }
  end

  def get_stylist_categories
    @service_stylists = ServiceStylist.where(service_category_id: params[:id] )
    return render partial: "stylist_categories", locals: { :@service_stylists => @service_stylists }
  end

  # GET /stylists/new
  def new
    @get_stylist = Stylist.all
    @stylist = Stylist.new
    @salons = Salon.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /stylists/1/edit
  def edit
  end

  # POST /stylists
  # POST /stylists.json
  def create
    @stylist = Stylist.new(stylist_params)

    respond_to do |format|
      if @stylist.save
        format.html { redirect_to new_salon_path, notice: 'Stylist was successfully created.' }
        format.json { render :show, status: :created, location: @stylist }
      else
        format.html { render :new }
        format.json { render json: @stylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stylists/1
  # PATCH/PUT /stylists/1.json
  def update
    respond_to do |format|
      if @stylist.update(stylist_params)
        format.html { redirect_to @stylist, notice: 'Stylist was successfully updated.' }
        format.json { render :show, status: :ok, location: @stylist }
      else
        format.html { render :edit }
        format.json { render json: @stylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stylists/1
  # DELETE /stylists/1.json
  def destroy
    @stylist.destroy
    respond_to do |format|
      format.html { redirect_to stylists_url, notice: 'Stylist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stylist
      @stylist = Stylist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stylist_params
      params.require(:stylist).permit(:salon_id, :branch_id, :service_category_id, :stylist_category_id, :name, :category)
    end
end
