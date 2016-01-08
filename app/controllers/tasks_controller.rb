class TasksController < ApplicationController
  before_action :set_task,  only: [:edit, :update]

  def index
    @not_started  = Task.not_started
    @doing        = Task.doing
    @accepted     = Task.accepted
    @task = Task.new
  end

  # def new
  # end

  def create
   @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: 'New Task Created'
    else
      redirect_to root_path, notice: 'Could Not Create'
    end

  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: 'Task updated'
    else
      redirect_to root_path, notice: 'Task could not update'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: 'Task was successfully destroyed.'
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

end
