class DollarCourseController < ApplicationController

  include DollarCourseHelper

  def show
    @course = get_dollar_course
  end

  def set
    #ищем модель, или создаем новую
    begin
      @dollar_course = DollarCustomization.find(1)
    rescue ActiveRecord::RecordNotFound
      @dollar_course = DollarCustomization.new if request.get?
    end

    if request.post?
      if !params[:dollar_customization].nil?
        course = params[:dollar_customization][:course]
        active_to = params[:dollar_customization][:active_to]
      else
        course = params[:course]
        active_to = params[:active_to]
      end

      if @dollar_course.nil?
        @dollar_course = DollarCustomization.new(course: course, active_to: active_to)
        saved = @dollar_course.save
      else
        saved = @dollar_course.update(course: course, active_to: active_to)
      end
      if saved
        redirect_to '/'
      else
        render :set, status: :unprocessable_entity
      end
    end
  end
end
