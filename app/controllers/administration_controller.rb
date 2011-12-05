class AdministrationController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def users
    @users = User.all
  end

  def configuration
    @config = Settings.all
  end

end
