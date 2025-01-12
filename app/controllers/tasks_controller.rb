class TasksController < ApplicationController
  def create
    @task = Task.create(task_params)

    if @task.save
      redirect_to list_path(@task.list_id)
    else
      redirect_to root_path
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to list_path(@task.list_id)
    else
      redirect_to root_path
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :done, :list_id)
  end
end
