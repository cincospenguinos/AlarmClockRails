require 'resque/tasks'

namespace :alarms do

  desc "Checks to see if an alarm needs to be started, and starts it if necessary"
  task check: :environment do

  	Alarm.all.each do |alarm|
      Resque.enqueue(SoundAlarmJob, alarm.id)
  		# puts "#{alarm.name}\t#{alarm.is_time?}"
  		# if alarm.is_time?
    #     break
  		# end
  	end
  end

end
