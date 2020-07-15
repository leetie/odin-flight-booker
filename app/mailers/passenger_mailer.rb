class PassengerMailer < ApplicationMailer
  default from: "bookings@odinflightbooker.com"

  def thank_you_email
    @passengers = params[:passengers]
    mail(to: @passengers.map{|i| i[1]}, subject: "Thank you for booking")
  end
end
