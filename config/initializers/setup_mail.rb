if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        ENV['MAILGUN_SMTP_SERVER'],
    port:           '587',
    authentication: :plain,
    user_name:      ENV['MAILGUN_SMTP_LOGIN'],
    password:       ENV['MAILGUN_SMTP_PASSWORD'],
    domain:         ENV['DOMAIN'],
    enable_starttls_auto: true
  }
end