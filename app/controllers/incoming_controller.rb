class IncomingController < ApplicationController
   
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!
  
  def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     puts "INCOMING PARAMS HERE: #{params}"

     puts "hello #{params[:sender]} this is about #{params[:subject]}"

    # You put the message-splitting and business
    # magic here.
     # Find the user by using params[:sender]
     # Find the topic by using params[:subject]
     # Assign the url to a variable after retreiving it from params["body-plain"]

     # Check if user is nil, if so, create and save a new user

     # Check if the topic is nil, if so, create and save a new topic

     # Now that you're sure you have a valid user and topic, build and save a new bookmark

    # Assuming all went well.
    render :text => "OK"
    #head 200
  end
  #render "parambs"
end