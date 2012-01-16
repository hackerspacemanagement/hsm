class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
