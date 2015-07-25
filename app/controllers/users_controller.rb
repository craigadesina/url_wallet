class UsersController < ApplicationController

  before_action :find_user, only: [:show, :email]
  
  def index

  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics
  end

  def email
    UserMailer.sample_email(@user).deliver_now
    redirect_to show
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
