# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    if super
      user = User.find_by_email params[:user][:email]
      log_action('registered', user) if user
    end
  end

  def update
    super
  end
end 
