class GradesController < ApplicationController
  before_action :set_grade, only: [:destroy]

  def show
    @grade = Grade.new
    @grade.user = current_user
    @grades = Grade.all
  end

  def create
    @grade = Grade.new(grade_params)
    @grade.user = current_user

    if @grade.save
      flash[:notice] = "Hat geklappt"

    else
      flash[:alert] = "Hat nicht geklappt"
    end
    redirect_to grades_path
  end

  def destroy
    @grade = Grade.find(params)
    @grade.destroy
    redirect_to grades_path
  end

  private

  def grade_params
    params.require(:grade).permit(:grade_value, :lecture)
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def getAverageGradePoint
    if current_user.grades.pluck("avg(grade_value)").join(',') != ""
        return current_user.grades.pluck("avg(grade_value)").join(',')

    else
        return "No grades entered yet"
    end
  end
  helper_method :getAverageGradePoint
end
