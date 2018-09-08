class GradesController < ApplicationController
  before_action :set_grade, only: [:destroy]

  def show
    @grade = Grade.new
    @grades = Grade.where('user_id = ?', current_user.id)
    #TODO wird das gebraucht? @grade.user = current_user
  end

  def create
    @grade = Grade.new(grade_params)
    @grade.user = current_user


    @grade.save

    # if @grade.save
    #   flash[:notice] = t('controllers.grades_controller.grade_not_saved')
    #
    # else
    #   flash[:alert] = t('controllers.grades_controller.grade_not_saved')
    # end
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

  def get_average_grade_point
    if current_user.grades.pluck("avg(grade_value)").join(',') != ""
      current_user.grades.pluck("avg(grade_value)").join(',')

    else
      t('controllers.grades_controller.grade_not_found')
    end
  end

  helper_method :get_average_grade_point
end
