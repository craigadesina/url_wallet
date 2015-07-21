class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  "admin@app8572295d9f7d4a2ca16a86b732ce74b5.mailgun.org"
    message.cc = nil
    message.bcc = nil
  end
end



if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        ENV['MAILGUN_SMTP_SERVER'],
    port:           '587',
    authentication: :plain,
    user_name:      ENV['MAILGUN_SMTP_LOGIN'],
    password:       ENV['MAILGUN_SMTP_PASSWORD'],
    domain:         ENV['MAILGUN_DOMAIN'],
    enable_starttls_auto: true
  }
end

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
