class MatchingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[new create]
  before_action :set_matching, only: %i[edit update destroy]

  def new
    @matching = @task.matchings.build
  end

  def create
    @matching = @task.matchings.build(matching_params)

    respond_to do |format|
      if @matching.save
        format.html { redirect_to lesson_path(@task.lesson), notice: "Lesson was successfully created." }
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
  end

  def destroy
    @matching.destroy!

    respond_to do |format|
      format.html { redirect_to lesson_path(@matching.task.lesson), notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_matching
    @matching = Matching.find(params[:id])
  end

  def matching_params
    params.require(:matching).permit(:first_word, :second_word, :checks)
  end
end
