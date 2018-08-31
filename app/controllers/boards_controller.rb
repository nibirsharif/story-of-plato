class BoardsController < ApplicationController
  load_and_authorize_resource

  def index
    @boards = Project.find(params[:project_id]).boards
  end
end
