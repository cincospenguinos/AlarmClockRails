# schedule.rb
#
# Cron jobs setup through the whenever gem
every 1.minute do
	rake 'alarms:check'
end