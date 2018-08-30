class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
    @cards = Card.select(project_id: @projects.pluck(:id))
  end

  # def create
  #   byebug
  #   respond_to do |format|
  #     format.html { redirect_to boards_path(:project_id => params[:project_id]) }
  #   end
  # end
end
