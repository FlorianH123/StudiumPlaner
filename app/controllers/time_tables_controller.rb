class TimeTablesController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @time_table = TimeTable.find_by('user_id = ?', current_user.id)
  end

  def edit
  end

  def update
    @time_table.update_attributes(time_table_params)
    redirect_to time_tables_path
  end

  def create
    @time_table = TimeTable.new(time_table_params)
    @time_table.user = current_user

    if @time_table.save
      flash[:notice] = t('timetable.timetable_saved')
    else
      flash[:alert] = @time_table.errors.full_messages.map(&:inspect).join(', ')
    end

    redirect_to time_tables_path
  end

  def new
    @time_table = TimeTable.new
    1.times {@time_table.table_rows.build}
  end

  def destroy
     if @time_table.destroy
       flash[:notice] = t('timetable.timetable_deleted')
     else
       flash[:alert] = t('timetable.timetable_not_deleted')
     end

    redirect_to time_tables_path
  end

  private

  def set_post
    @time_table = TimeTable.find(params[:id])
  end

  def time_table_params
    params.require(:time_table).permit(:caption, table_rows_attributes:
        [:id, :order, :period, :monday_field, :tuesday_field,
         :wednesday_field, :thursday_field, :friday_field, :saturday_field])
  end

  def return_to_break(string)
    string.gsub(/\n/, '<br>').html_safe
  end

  helper_method :return_to_break
end