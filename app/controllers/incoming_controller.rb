class IncomingController < ApplicationController
   
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!
  
  def create
    unless params[:sender] == ENV['MAILGUN_SMTP_LOGIN']
      @user = User.find_by(email: params[:sender])
      create_new_user(@user, params[:sender])
    else
     @user = User.find_by(email: params[:from])
      create_new_user(@user, params[:from])
    end

    # Find the topic by using params[:subject]
    @topic = @user.topics.find_or_create_by(title: params[:subject])
     
     # Assign the url to a variable after retreiving it from params["body-plain"]
     @url = @topic.bookmarks.find_or_create_by(url: params["body-plain"])
    
    # Assuming all went well.
    render :text => "OK"
    #head 200
  end

  private

  def create_new_user(user, handle)
    if user.nil?
        user = User.new(email: handle, password: handle)
        user.skip_confirmation!
        user.save!
    end
  end
end