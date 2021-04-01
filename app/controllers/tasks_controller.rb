class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @navitasks = Task.all.order(created_at: :desc).page(params[:page]).per(5)
    @taskcalendar = Task.all
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task), notice: "タスク「#{@task.title}」を登録しました。"
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
    redirect_to tasks_url, notice: "タスク「#{task.title}」を更新しました。"
  end

  def destroy
    if @task.user_id == current_user.id
      @task.destroy
      redirect_to tasks_url, notice: "タスク「#{@task.title}」を削除しました。"
    else
      redirect_to tasks_url
    end
  end

  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_date, :end_date).merge(user_id: current_user.id)
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
