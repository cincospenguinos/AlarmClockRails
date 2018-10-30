class SoundingAlarmController < ApplicationController

	# POST /shutdown
	def shutdown
		if Alarm.has_one_sounding?
			Rails.logger.info('Shutting down the alarm...')
			sounding_alarm = Alarm.where.not(song_pid: nil).first
			`kill #{sounding_alarm.song_pid}`
			sounding_alarm.update!(is_sounding: false, song_pid: nil)
		end
	end
end
