class GradesController < ApplicationController
  before_action :set_grade, only: [:destroy]

  def index
    @grade = Grade.new
    @grades = Grade.where('user_id = ?', current_user.id)
  end

  def create
    @grade = Grade.new(grade_params)
    @grade.user = current_user

    @grade.grade_value = @grade.grade_value.round(2)

    if @grade.save
      flash[:notice] = t('controllers.grades_controller.grade_saved')
    else
      flash[:alert] = @grade.errors.full_messages.map(&:inspect).join(',')
    end

    redirect_to grades_path
  end

  def destroy
    @grade.destroy

    redirect_to grades_path
  end

  private

  def grade_params
    params.require(:grade).permit(:grade_value, :lecture, :id)
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def round_to
    float fl = (10 ** 2).to_f
    nr = self * f
    nr.round / f
  end

  def get_average_grade_point
    if current_user.grades.pluck("avg(grade_value)").join(',') != ""
      "%0.2f" % [current_user.grades.pluck("avg(grade_value)").join(',')]
    else
      t('controllers.grades_controller.grade_not_found')
    end
  end

  helper_method :get_average_grade_point
end
