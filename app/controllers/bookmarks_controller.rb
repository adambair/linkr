class BookmarksController < ApplicationController
  before_filter :require_user

  def index
    @bookmarks = Bookmark.public.paginate(:page => params[:page])
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = current_user.bookmarks.new(:title => params[:title], :url => params[:url])
  end

  def save
    original_bookmark = Bookmark.find(params[:id])
    @bookmark = original_bookmark.dup
    @bookmark.tag_list = original_bookmark.tag_list
    render :new
  end

  def bookmarklet
    @bookmark = current_user.bookmarks.new(:title => params[:title], :url => params[:url])
    render :layout => "minimal"
  end

  def edit
    @bookmark = current_user.bookmarks.find(params[:id])
  end

  def create
    @bookmark = current_user.bookmarks.new(params[:bookmark])

    if @bookmark.save
      redirect_to dashboard_url, notice: 'Bookmark was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @bookmark = current_user.bookmarks.find(params[:id])

    if @bookmark.update_attributes(params[:bookmark])
      redirect_to dashboard_url, notice: 'Bookmark was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy

    redirect_to bookmarks_url
  end
end

