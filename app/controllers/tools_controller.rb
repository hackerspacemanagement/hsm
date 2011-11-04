class ToolsController < ApplicationController
    before_filter :authenticate_user, :except => [:index, :show]
    
    def authenticate_user
        if !user_signed_in? then
            flash[:alert] = "You need to sign in or sign up before continuing"
            redirect_to "/users/sign_in"
        end
    end
    
    def index
        @username = ""
        
        if params[:id]
            @username = User.find(params[:id]).full_name;
            @Tools = Tool.where( :user_id => params[:id] ).order(sort_order('created_at'))
        else
            @Tools = Tool.all
        end
    end
    
    def new
        # Is this such a good idea? Why do I have to do this anyways?
        @Tool = Tool.new
    end
    
    def create
        @Tool = Tool.new(params[:tool]);
        @Tool.user_id = current_user.id
        @Tool.date_added = Time.now
        @Tool.save
    end
end
