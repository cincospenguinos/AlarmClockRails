class SoundingAlarmController < ApplicationController

	# POST /shutdown
	def shutdown
		if SOUNDING_ALARM
			Rails.logger.info('Shutting down the alarm...')
			Resque::Job.destroy(SOUNDING_ALARM, 'SoundAlarm')
			SOUNDING_ALARM = nil
		end
	end
end
