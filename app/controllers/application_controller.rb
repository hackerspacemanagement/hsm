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

  def log_action(event, object)
    action = UserAction.new event: event
    action.object = @tool

    if !action.save
      flash[:alert] = "Could not log action."
    end
  end
 
end
