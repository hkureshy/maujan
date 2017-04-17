class ServicesController < ApplicationController
  include ServicesHelper
  before_action :set_service, only: [:cart_item, :show, :edit, :update, :destroy]
  before_action :set_branch, only: [:index, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]

  # GET /services
  # GET /services.json

  def index
    # session[:services_in_cart] = []
    # session[:services_in_cart_js] = ''
    if session[:services_in_cart] && !session[:services_in_cart].empty?
      @service_price_count = 0
      Service.where("id in (?)", session[:services_in_cart].map{|x| x['id']}).each do |service|
        @service_price_count += service.discount_price
      end
    else
      @service_price_count = 0
    end

    @customer = Customer.new
    @service_categories = @branch.service_categories
    @stylist_categories = @branch.stylist_categories
    category = @service_categories.first
    if params[:service_category_id]
      category = ServiceCategory.find(params[:service_category_id])
    elsif params[:stylist_category_id]
      sc = StylistCategory.find(params[:stylist_category_id])
      # category = ServiceCategory.find(ss.service_category)
    end
    @services = category.services
    
    @discount_price = []
    @services.each do |serv_disc|
      @discount_price << serv_disc.discount_price
    end
  end

  def get_branches
    @salon = Salon.find(params[:id])
    @branches = @salon.branches
    return render partial: "branches", locals: { :@branches => @branches }
  end

  def get_service_categories
    @branch = Branch.find(params[:id])
    @service_categories = @branch.service_categories
    return render partial: "get_service_categories", locals: { :@service_categories => @service_categories }
  end

  def import
    Service.import(params[:file])
    redirect_to new_service_path, notice: "Service Uploaded"
  end

  def cart_item
    session[:services_in_cart] = [] unless session[:services_in_cart]
    session[:services_in_cart_js] = '' unless session[:services_in_cart_js]
    session[:services_in_cart] << {id: params[:id], date: params[:date], time: params[:time]}
    session[:services_in_cart_js] += ",#{params[:id]}"
    return render partial: "cart_item", locals: { :@service => @service, date: params[:date], time: params[:time], discount: check_discount_on_service(@service.id, params[:date], params[:time])}
  end
  
  def remove_cart_item
    session[:services_in_cart] = session[:services_in_cart].reject { |h| h["id"] == "#{params[:id]}" }
    render nothing: true
  end
  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
    @salons = Salon.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.new
    @salons = Salon.all
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to new_salon_path, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def set_branch
      @branch = Branch.find(params[:branch_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:salon_id, :branch_id, :service_category_id, :service_name, :price, :discount)
    end
end
