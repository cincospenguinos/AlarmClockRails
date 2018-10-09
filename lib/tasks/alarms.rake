namespace :alarms do

  desc "Checks to see if an alarm needs to be started, and starts it if necessary"
  task check: :environment do

  	Alarm.all.each do |alarm|
  		if alarm.is_time? && SOUNDING_ALARM.nil?
  			# Get the playlist associated with this alarm and grab all of its songs

  			# Play each song to completion
  		end

  		puts Dir.pwd
  	end
  end

end
