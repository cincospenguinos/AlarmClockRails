require 'resque/tasks'

namespace :alarms do

  desc "Checks to see if an alarm needs to be started, and starts it if necessary"
  task check: :environment do

  	Alarm.all.each do |alarm|
  		if alarm.is_time? && SOUNDING_ALARM.nil?
        SOUNDING_ALARM = 'sounding'
        SoundAlarmJob.set(queue: 'sounding_alarm').perform_now(alarm)
  		end

  		puts Dir.pwd
  	end
  end

end
