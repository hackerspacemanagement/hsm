class AdministrationController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def roles
      @roles = Role.all
  end
  
  def roles_edit
      @role  = Role.find(params[:role])
  end

end
