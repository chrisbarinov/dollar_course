require 'clockwork'
include Clockwork
require './config/boot'
require './config/environment'

every(10.seconds, 'refresh.dollar.course') {RefreshDollarCourseJob.perform_now}
