class BookingMailer < ApplicationMailer
	default from: "noreply@maujan.com"

	def send_mail(customer)
		@customer = customer
		mail(to: @customer.email, subject: 'Booking Confirmation')
	end
end
