class TagsController < ApplicationController
  before_filter :require_user

  def index
    @tags = Bookmark.public.tag_counts
    @user_tags = current_user.bookmarks.tag_counts
  end

  def show
    @tag = params[:id]
    @bookmarks = Bookmark.public.tagged_with(@tag, :any => true).paginate(:page => params[:page])
  end
end

