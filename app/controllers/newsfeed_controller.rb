class NewsfeedController < ApplicationController
  def index
    @siteactions = UserAction.page(params[:site_page] ).order('created_at DESC')
    @newusers    = UserAction.where("obj_type = 'User'").page(params[:users_page]).order('created_at DESC')
  end
end
