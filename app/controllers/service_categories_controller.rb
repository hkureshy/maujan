class ServiceCategoriesController < ApplicationController
  before_action :set_service_category, only: [:get_services, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]

  # GET /service_categories
  # GET /service_categories.json

  def index
    @service_categories = ServiceCategory.all
  end

  def get_services
    @services = @service_category.services
    return render partial: "services", locals: { :@services => @services }
  end

  # GET /service_categories/1
  # GET /service_categories/1.json
  def show
  end

  # GET /service_categories/new
  def new
    @get_serviceCat = ServiceCategory.all
    @service_category = ServiceCategory.new
    @salons = Salon.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /service_categories/1/edit
  def edit
  end

  # POST /service_categories
  # POST /service_categories.json
  def create
    @service_category = ServiceCategory.new(service_category_params)

    respond_to do |format|
      if @service_category.save
        format.html { redirect_to new_salon_path, notice: 'Service category was successfully created.' }
        format.json { render :show, status: :created, location: @service_category }
      else
        format.html { render :new }
        format.json { render json: @service_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_categories/1
  # PATCH/PUT /service_categories/1.json
  def update
    respond_to do |format|
      if @service_category.update(service_category_params)
        format.html { redirect_to @service_category, notice: 'Service category was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_category }
      else
        format.html { render :edit }
        format.json { render json: @service_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_categories/1
  # DELETE /service_categories/1.json
  def destroy
    @service_category.destroy
    respond_to do |format|
      format.html { redirect_to service_categories_url, notice: 'Service category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_category
      @service_category = ServiceCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_category_params
      params.require(:service_category).permit(:category, :salon_id, :branch_id)
    end
end
