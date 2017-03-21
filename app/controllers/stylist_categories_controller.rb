class StylistCategoriesController < ApplicationController
  before_action :set_stylist_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]

  # GET /stylist_categories
  # GET /stylist_categories.json

  def index
    @stylist_categories = StylistCategory.all
  end

  # GET /stylist_categories/1
  # GET /stylist_categories/1.json
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

  # GET /stylist_categories/new
  def new
    @stylist_category = StylistCategory.new
    @salons = Salon.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /stylist_categories/1/edit
  def edit
  end

  # POST /stylist_categories
  # POST /stylist_categories.json
  def create
    @stylist_category = StylistCategory.new(stylist_category_params)

    respond_to do |format|
      if @stylist_category.save
        ServiceStylist.create(stylist_category_id: @stylist_category.id, service_category_id: @stylist_category.service_category_id)
        format.html { redirect_to new_salon_path, notice: 'Stylist category was successfully created.' }
        format.json { render :show, status: :created, location: @stylist_category }
      else
        format.html { render :new }
        format.json { render json: @stylist_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stylist_categories/1
  # PATCH/PUT /stylist_categories/1.json
  def update
    respond_to do |format|
      if @stylist_category.update(stylist_category_params)
        format.html { redirect_to @stylist_category, notice: 'Stylist category was successfully updated.' }
        format.json { render :show, status: :ok, location: @stylist_category }
      else
        format.html { render :edit }
        format.json { render json: @stylist_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stylist_categories/1
  # DELETE /stylist_categories/1.json
  def destroy
    @stylist_category.destroy
    respond_to do |format|
      format.html { redirect_to stylist_categories_url, notice: 'Stylist category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stylist_category
      @stylist_category = StylistCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stylist_category_params
      params.require(:stylist_category).permit(:salon_id, :branch_id, :service_category_id, :category)
    end
end
