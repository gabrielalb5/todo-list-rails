class TasksController < ApplicationController
  def crate
    @task = Task.create(task_params)

    if @task.save
      redirect_to list_path(@task.list_id)
    else
      redirect_to root_path
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :done, :todo_id)
  end
end
