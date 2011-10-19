class DashboardController < ApplicationController
  before_filter :require_user

  def show
    @bookmarks = current_user.bookmarks.paginate(:page => params[:page])
  end
end
