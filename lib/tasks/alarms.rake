namespace :alarms do

  desc "Checks to see if an alarm needs to be started, and starts it if necessary"
  task check: :environment do

  	Alarm.all.each do |alarm|
  		# puts "#{alarm.name}\t#{alarm.is_time?}"
  		# alarm_sounding = Alarm.has_one_sounding?
  		# if alarm.is_time? && !alarm_sounding
  			alarm.update!(is_sounding: true, song_pid: Process.pid)
  			SoundAlarmJob.perform_now(alarm.id)
        alarm.update!(is_sounding: false, song_pid: nil)
    #     break
  		# end
  	end
  end

end
