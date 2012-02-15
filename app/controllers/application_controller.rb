class ApplicationController < ActionController::Base
  protect_from_forgery

  def sort_order(default)
    "#{(params[:c] || default.to_s).gsub(/[\s;'\"]/,'')} #{params[:d] == 'down' ? 'DESC' : 'ASC'}"
  end 
  
  def can_manage_all?
     if current_user and can? :manage, :roles
      return
    end
    flash[:alert] = "You aren't authorized to view this!"
    redirect_to root_path
  end

  def get_space_actions
    UserAction.page(params[:site_page] ).order('created_at DESC')
  end

  def get_user_log
    UserAction.where("obj_type = 'User'").page(params[:users_page]).order('created_at DESC')
  end

  def log_action(event, object)
    action        = UserAction.new event: event
    action.object = object
    action.user   = current_user

    if !action.save
      flash[:alert] = "Could not log action."
    end
  end

end
