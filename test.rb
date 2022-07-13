require 'action_mailer'

class Mailer < ActionMailer::Base
  def notification(from_email)
    mail(to: ENV['TO'], from: from_email, subject: "Test Email #1") do |format|
      format.text {"Simple test mail"}
    end
  end
end

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address        => "smtp.gmail.com",
  :port           => 587,
  :domain         => "gmail.com",
  :authentication => :plain,
  :user_name      => ENV['FROM'],
  :password       => ENV['PW'], # Your password
  :enable_starttls_auto => true
}

Mailer.notification(ENV['FROM']).deliver_now


