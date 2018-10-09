class SoundingAlarmController < ApplicationController

	# POST /shutdown
	def shutdown
		if SOUNDING_ALARM
			puts 'Alarm is sounding...'
		else
			puts 'Alarm is not sounding.'
		end
	end
end
