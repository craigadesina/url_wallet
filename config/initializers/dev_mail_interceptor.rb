class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  ENV['MAILGUN_SMTP_LOGIN']
    message.cc = nil
    message.bcc = nil
  end
end

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
