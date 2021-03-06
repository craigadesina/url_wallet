class BookmarksController < ApplicationController
  
  before_action :set_bookmark, except: [:new, :create]
  
  before_action :set_topic

  def show
    authorize @bookmark
  end

  def new
    authorize @bookmark
  end

  def create
    @bookmark = @topic.bookmarks.build(bookmark_params)
    authorize @bookmark
    if @bookmark.save
      flash[:notice] = "bookmark was sucessfully created"
      redirect_to @topic
    else
      flash[:alert] = "Sorry, bookmark could not be created because #{@bookmark.errors.messages}"
      redirect_to @topic
    end
  end

  def edit
    authorize @bookmark
  end

  def update
    authorize @bookmark
    if @bookmark.update(bookmark_params)
      flash[:notice] = "Thanks! Bookmark was sucessfully updated"
      redirect_to @topic
    else
      flash[:alert] = "Sorry, bookmark could not be updated because #{@bookmark.errors.messages}"
      redirect_to @topic
    end
  end

  def destroy
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "bookmark was sadly deleted :("
      redirect_to @topic
    else
      flash[:alert] = "Sorry, bookmark could not be deleted because #{@bookmark.errors.messages}"
      redirect_to @topic
    end
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
