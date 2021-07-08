class RefreshDollarCourseChannel < ApplicationCable::Channel
  def subscribed
    stream_from "refresh_dollar_course"
  end
end
