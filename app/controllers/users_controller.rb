class UsersController < ApplicationController

  

  def show
    @user = User.find(params[:id])
    #@user = current_user
  end

  def email
    @user = User.find(params[:id])
    #@user = current_user
    UserMailer.sample_email(@user).deliver_later
    redirect_to show
  end
end
