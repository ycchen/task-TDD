class TasksController < ApplicationController
	before_filter :set_task, only: [:show, :edit, :update, :destroy ]
  
  def index
  	@task = Task.new
  	@tasks = Task.all
  end

  def create
  	# render params.inspect
  	Task.create(task_params)
  	redirect_to tasks_path
  end

  def edit
  	# render @task.inspect
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      redirect_to :back, alert: 'There was an error updating your task.'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task has been deleted.'

  end

  private
  
  def set_task
  	@task = Task.find(params[:id])
  end

  def task_params
  	params.require(:task).permit(:task)
  end

end
