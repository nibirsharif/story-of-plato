class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = current_user.projects
    @cards = Card.select(project_id: @projects.pluck(:id))
  end
end
