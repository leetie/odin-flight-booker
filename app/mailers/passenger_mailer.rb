class PassengerMailer < ApplicationMailer
  default from: "bookings@odinflightbooker.com"

  def thank_you_email
    @passengers = params[:passengers]
    @flight = params[:flight]
    mail(to: @passengers.map{|i| i[1]}, subject: "Thank you for booking")
  end
end
