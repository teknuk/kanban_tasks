class TasksController < ApplicationController
  before_action :set_task, only: [:edit]

  def index
    @not_started = Task.not_started
    @doing = Task.doing
    @accepted = Task.accepted
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

  def update_status
    respond_to do |format|
      format.json {
        array = JSON.parse(params[:data_value])
        if Task.find(array[0].to_i).update_attributes(status: status(array))
          render json: :success
        end
      }
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

  def status array
    new_status = array[1]
    new_status = 'started' if new_status.to_s == "doing"
    new_status = 'not_started' if new_status.to_s == "notStarted"
    new_status.to_s
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

end
