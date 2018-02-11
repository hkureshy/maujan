class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    @name = @customers.pluck(:name)
    @salon = Salon.all.pluck(:salon_name)
    @branch = Branch.all.pluck(:name)
    if params[:branch] && !params[:branch].blank?
      @customers = Customer.all
    end
    if params[:salon] && !params[:salon].blank?
      @customers = Customer.all
    end
    if params[:name] && !params[:name].blank?
      @customers = Customer.where(name: params[:name])
    end
    @date = [0]
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if params[:stylist_id]
        stylist = Stylist.find(params[:stylist_id])
        existing_booking_for_stylist = false
        service_ids = session[:services_in_cart].map {|e| e['id']}
        services = Service.where('id in (?)', service_ids)
        
#        service_stylist = ServStyl.where('stylist_id = ? AND service_id in (?)', params[:stylist_id], service_ids)
        
        stylist.services.each do |service|
          service.booking_services.each do |booking_service|
            services.each do |service|
              if booking_service.service_id == service['id']
                if service['date'] == booking_service.booking_date && service['time'] == booking_service.booking_time
                  existing_booking_for_stylist = true
                  break
                end
              end
            end
          end
        end
        
#        if service_stylist.empty? #if no service for this stylist exists
#         unless existing_booking_for_stylist #if no service for this stylist exists
          if @customer.save
            booking = Booking.create(customer_id: @customer.id)
            services.each do |service|
              BookingService.create(booking_id: booking.id, service_id: service['id'], booking_date: service['date'], booking_time: service['time'] )
              # ServStyl.create(service_id: service['id'], stylist_id: params[:stylist_id])
            end

            BookingMailer.send_mail(@customer).deliver
          end
        # end

        session[:services_in_cart] = []
        session[:services_in_cart_js] = ''

        format.html { redirect_to root_url, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:booking_id, :name, :email, :phone_no)
    end
end
