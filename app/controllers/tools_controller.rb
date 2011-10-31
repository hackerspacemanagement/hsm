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
end
