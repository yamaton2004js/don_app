class TodosController < ApplicationController

  def index
    @todos = Todo.all.includes(:user).order(start_date_time: "asc")
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(todo_params)
    if @todo.save
      redirect_to root_path, notice: '追加しました'
    else
      flash.now[:alert] = '入力してください。'
      render :new 
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end


  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to root_path, notice: '編集しました。'
    else
      flash.now[:alert] = '編集失敗'
      render :edit
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:start_date_time, :content, :company, :LOC).merge(user_id: current_user.id)
  end
end
