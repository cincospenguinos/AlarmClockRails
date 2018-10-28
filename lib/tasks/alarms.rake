require 'resque/tasks'

namespace :alarms do

  desc "Checks to see if an alarm needs to be started, and starts it if necessary"
  task check: :environment do

  	Alarm.all.each do |alarm|
      puts alarm.is_time?
  		if alarm.is_time? && SOUNDING_ALARM.nil?
        puts 'Sounding alarm!'
        SOUNDING_ALARM = 'sounding_alarm'
        SoundAlarmJob.set(queue: SOUNDING_ALARM).perform_now(alarm)
  		end
  	end
  end

end
