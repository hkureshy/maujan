module ServicesHelper
  def service_price_count
    if session[:services_in_cart] && !session[:services_in_cart].empty?
      Service.where("id in (?)", session[:services_in_cart].uniq).sum(:price)
    else
      0
    end
  end
  
  def check_discount_on_service(id, date, time)
    service = Service.find(id)
    service_category = service.service_category
    branch = service_category.branch
    salon  = branch.salon
    discount = Discount.find_by(salon_id: salon, branch_id: branch, service_category_id: service_category)
    if discount
      d_date = discount.discount_date
      d_time = discount.discount_time
#      d_percent = discount.discount_percent
      d_date == date.to_date && d_time.strftime("%H-%M-%S") == time.to_time.strftime("%H-%M-%S")
    else
      false
    end
  end
end
