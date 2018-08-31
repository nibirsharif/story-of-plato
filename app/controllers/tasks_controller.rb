class TasksController < ApplicationController
  load_and_authorize_resource

  def index
    @tasks = TaskList.find(params[:task_list_id]).tasks
  end
end
