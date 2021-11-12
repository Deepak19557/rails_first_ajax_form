class NotificationMailer < ActionMailer::Base
    default from: 'deepakyuvasoft305@gmail.com'
    layout 'mailer'
  
    def send_signup_email(admin)
        @admin = admin
        mail( to: @admin.email, subject: 'Thanks for signing up for our amazing app' )
      end
end
  