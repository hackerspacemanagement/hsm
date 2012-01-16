class Admin::RolesController < ApplicationController
  before_filter :can_manage_all?
 
  def index
    @roles = Role.all
  end

  def new
  end

  def create
  end

  def show
    @role = Role.find(params[:id])
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
