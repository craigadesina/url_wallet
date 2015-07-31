class TopicsController < ApplicationController

  before_action :set_topic, except: [:new, :create, :index]
  
  before_action :set_user, except: [:show, :index]

  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    @topics = Topic.paginate(:page => params[:page], :per_page => 2)
  end

  def show
    
  end

  def new
    authorize @topic
    @topic = @user.topics.new
  end

  def create
    @topic = @user.topics.build(topic_params)
    authorize @topic
    if @topic.save
      flash[:notice] = "topic was sucessfully created"
      redirect_to @user
    else
      flash[:alert] = "Sorry, topic could not be created because #{@topic.errors.messages}"
      redirect_to @user
    end
  end

  def edit
    authorize @topic
  end

  def update
    authorize @topic
    if @topic.update(topic_params)
      flash[:notice] = "topic was sucessfully updated"
      redirect_to @user
    else
      flash[:alert] = "Sorry, topic could not be updated because #{@topic.errors.messages}"
      redirect_to @user
    end
  end

  def destroy
    authorize @topic
    if @topic.destroy
      flash[:notice] = "topic was sadly deleted :("
      redirect_to @user
    else
      flash[:alert] = "Sorry, topic could not be deleted because #{@topic.errors.messages}"
      redirect_to @user
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
