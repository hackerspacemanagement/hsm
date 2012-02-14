class NewsfeedController < ApplicationController
  def index
    @siteactions = get_space_actions
    @newusers    = get_user_log
  end
end
