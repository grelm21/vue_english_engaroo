class LessonsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_lesson, only: %i[ show edit update destroy new_task]
  before_action :get_course, only: %i[index new create ]
  before_action :get_user

  # GET /lessons or /lessons.json
  def index
    @lessons = @course.lessons.all
  end

  # GET /lessons/1 or /lessons/1.json
  def show
    @new_task = params[:new_task]||= false
    @edit_task = Task.find(params[:edit_task]) if params[:edit_task].present?

    @tasks = @lesson.tasks.all

    if @new_task
      @task = @lesson.tasks.build
    end


    @tasks_build = Hash.new
    @tasks.each do |task|
      @tasks_build[task.id] = task.matchings.build
    end

    puts "TASKS #{@tasks_build}"
  end

  # GET /lessons/new
  def new
    @lesson = @course.lessons.build
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = @course.lessons.build(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to course_lessons_path(@course), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy!

    respond_to do |format|
      format.html { redirect_to course_lessons_url(@course), notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def new_task
    @new_task = params[:bool]
    puts "FOR CONTROLLER #{@new_task}"
    redirect_to lesson_path(@lesson)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def get_course
    @course = Course.find(params[:course_id])
  end

  def get_user
    @user = current_user
  end

  # def set_task
  #   @task = @lesson.tasks.build
  # end

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(:title, :description, :demo)
  end

  def task_params
    params.require(:task).permit(:description, :note, :order, :type)
  end
end
