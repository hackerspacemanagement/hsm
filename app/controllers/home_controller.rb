class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    @siteactions = get_space_actions
    @newusers    = get_user_log
  end
end
