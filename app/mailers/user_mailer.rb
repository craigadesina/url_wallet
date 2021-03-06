class UserMailer < ActionMailer::Base
  
  def sample_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {:from    => @user.email,
                      :to      => 'sorting@app8572295d9f7d4a2ca16a86b732ce74b5.mailgun.org',
                      :subject => 'First Topic. awesome. Testing Mailgun recieving API',
                      :text    => 'http://ginthurb.com/mailgun/mailgun-ruby'}
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  end
end