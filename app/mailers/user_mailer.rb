class UserMailer < ActionMailer::Base
  

  def sample_email(user)
     @user = user
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {:from    => @user.email,
                      :to      => 'admino@app8572295d9f7d4a2ca16a86b732ce74b5.mailgun.org',
                      :subject => 'Testing Mailgun recieving API',
                      :text    => '2nd Testing for recieve 37signals.'}
    mg_client.send_message ENV['DOMAIN'], message_params
  end
end