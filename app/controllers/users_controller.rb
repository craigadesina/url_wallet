class UsersController < ApplicationController

  before_action :find_user, only: [:show, :email]
  
  def show
    @topics = @user.topics
    @upvoted_bookmarks = @user.bookmarks.paginate(:page => params[:page], :per_page => 6)
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
