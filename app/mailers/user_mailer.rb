class UserMailer < ActionMailer::Base
  

  def sample_email(user)
     @user = user
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {:from    => @user.email,
                      :to      => 'admino@app8572295d9f7d4a2ca16a86b732ce74b5.mailgun.org',
                      :subject => 'First Topic. awesome. Testing Mailgun recieving API',
                      :text    => 'https://github.com/mailgun/mailgun-ruby'}
    mg_client.send_message ENV['DOMAIN'], message_params
  end
end