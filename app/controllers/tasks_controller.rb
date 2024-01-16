class TasksController < ApplicationController
  before_action :get_lesson, only: %i[create new]
  before_action :set_task, only: %i[edit update destroy]
  before_action :authenticate_user!

  def new
  end

  def create
    @task = @lesson.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to lesson_path(@lesson), notice: "Lesson was successfully created." }
        # format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to lesson_path(@task.lesson), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to lesson_path(@task.lesson), notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def task_params
    params.require(:task).permit(:description, :note, :order, :task_type)
  end

  def get_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
