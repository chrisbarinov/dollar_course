class RefreshDollarCourseJob < ApplicationJob
  queue_as :default
  include DollarCourseHelper

  def perform()
    #берем курс доллара
    course = get_dollar_course
    #распространяем его на подписчиков
    ActionCable.server.broadcast("refresh_dollar_course", { body:  course})
  end
end
