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
    discount_percent = false
    discounts = Discount.where(salon_id: salon, branch_id: branch, service_category_id: service_category, service_id: service.id)
    discounts.each do |discount|
      if true
        d_date = discount.discount_date
        d_time = discount.discount_time
  #      d_percent = discount.discount_percent
        if d_date == date.to_date && d_time.strftime("%H-%M-%S") == time.to_time.strftime("%H-%M-%S")
          discount_percent = discount.discount_percent
        else
          false
        end
      else
        false
      end
    end
    discount_percent
  end
  
  def service_discount_date(service)
    date = []
    service.discounts.each do |d|
      date << d.discount_date.strftime()
    end
    date.join('|')
  end
  
  def service_discount_time(service)
    time = []
    service.discounts.each do |d|
      time << d.discount_time.strftime("%H:%M")
    end
    time.join('|')
  end
  
  def service_discount_percent(service)
    percent = []
    service.discounts.each do |d|
      percent << d.discount_percent
    end
    percent.join('|')
  end
end
