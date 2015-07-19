class UserMailer < ActionMailer::Base
  

  def sample_email(user)
     @user = user
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {:from    => ENV['SENDGRID_USERNAME'],
                      :to      => 'kokolo@app8572295d9f7d4a2ca16a86b732ce74b5.mailgun.org',
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => '2nd Testing for recieve 37signals. This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['DOMAIN'], message_params
  end
end