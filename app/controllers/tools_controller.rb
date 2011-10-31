class ToolsController < ApplicationController
    def index
        @Tools = Tool.all
    end
end
