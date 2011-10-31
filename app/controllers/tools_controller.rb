class ToolsController < ApplicationController
    def index
        @username = ""
        
        if params[:id]
            @username = User.find(params[:id]).full_name;
            
            @Tools = Tool.where( :owner_id => params[:id] );
        else
            @Tools = Tool.all
        end
    end
    
    def new
        @Tool = Tool.new
    end
    
    def create
        @Tool = Tool.new(params[:tool]);
        @Tool.owner_id = current_user.id
        @Tool.date_added = Time.now
        @Tool.save
    end
end
