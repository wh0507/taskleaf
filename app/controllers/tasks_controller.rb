class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    if @task.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    if @task.user_id == current_user.id
      @task.destroy
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
    else
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :start_date, :end_date).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
