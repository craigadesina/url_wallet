class VotesController < ApplicationController

  before_action :set_user

  before_action :set_topic

  before_action :set_bookmark

  def create
    @vote = Vote.new(user: @user, bookmark: @bookmark)
    authorize @vote
    if @vote.save
      flash[:notice] = "Great! You just liked this bookmark!"
      redirect_to topic_bookmark_path(@topic, @bookmark)
    else
      flash[:alert] = "Sorry, we could not create an upvote because #{@vote.errors.messages}"
      redirect_to topic_bookmark_path(@topic, @bookmark)
    end
  end

  def destroy
    if @bookmark.users.include?(@user)
      @vote = @bookmark.votes.find_by(user: @user)
      authorize @vote
      @vote.destroy
      flash[:notice] = "Aww.. You have sadly un-liked this bookmark"
      redirect_to topic_bookmark_path(@topic, @bookmark)
    else
      flash[:alert] = "Sorry, you can only downvote your own votes"
      redirect_to topic_bookmark_path(@topic, @bookmark)
    end
  end


  private

  #def topic_params
   # params.require(:topic).permit(:title)
  #end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def set_user
    @user = current_user
  end
end
