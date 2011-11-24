class ToolsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @tools = Tool.all
  end
  
  def new
    @tool = Tool.new
  end
  
  def create
    @tool = Tool.new(params[:tool]);
    @tool.user_id = current_user.id
    @tool.date_added = Time.now
    if @tool.save
      flash[:notice] = "Dude, you are awesome. You've added a tool."
      redirect_to tools_path
    else
      flash[:alert] = 'You broke something. :-('
      redirect_to new_tool_path
    end
  end
end
