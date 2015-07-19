class IncomingController < ApplicationController
   
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!
  
  def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     #puts "INCOMING PARAMS HERE: #{params}"

     #puts "hello #{params[:sender]} this is about #{params[:subject]}"

    # You put the message-splitting and business
    # magic here.
     # Find the user by using params[:sender]
     @user = User.find_by(email: params[:from])
      
      # Find the topic by using params[:subject]
    @topic = @user.topics.find_or_create_by(title: params[:subject])
     
     # Assign the url to a variable after retreiving it from params["body-plain"]
     @url = @topic.bookmarks.find_or_create_by(url: params["body-plain"])
     
     # Check if user is nil, if so, create and save a new user
    if @user.nil?
      @user = User.new(email: params[:from])
      @user.save!
    end

     # Check if the topic is nil, if so, create and save a new topic
     #if @topic.nil?
      #@topic = @user.topics.create(title: params[:subject])
     #end

     # Now that you're sure you have a valid user and topic, build and save a new bookmark

    # Assuming all went well.
    render :text => "OK"
    #head 200
  end
  #render "parambs"
end