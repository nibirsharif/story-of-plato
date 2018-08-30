class BoardsController < ApplicationController
  def index
    @boards = Project.find(params[:project_id]).boards
  end
end
