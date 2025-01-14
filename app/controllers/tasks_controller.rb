class TasksController < ApplicationController
  def create
    @task = Task.create(task_params)
    @task.done = false

    if @task.save
      redirect_to list_path(@task.list_id)
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

  def toggle_done
    @task = Task.find(params[:id])
    @task.done = !@task.done
    if @task.save
      redirect_to list_path(@task.list_id), notice: "Tarefa atualizada com sucesso."
    else
      redirect_to root_path, alert: "Falha ao atualizar a tarefa."
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to list_path(@task.list_id), notice: "Tarefa excluída com sucesso."
  end

  private
  def task_params
    params.require(:task).permit(:name, :done, :list_id)
  end
end
