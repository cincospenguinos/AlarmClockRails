class SoundAlarmJob < ApplicationJob
  @queue = :sounding_alarms

  def perform(alarm_id)
    alarm = Alarm.find(alarm_id)
  	Dir.chdir('tmp/songs') do
  		playlist = alarm.playlist
	  	playlist.songs.each do |song_model|
	  		File.open(song_model.file_name, 'wb') { |f| f.write(song_model.song.download) }
	  		`mplayer #{song_model.file_name} &> /dev/null`
        File.delete(song_model.file_name) # Always remove the song when you're done with it
	  	end
  	end
    alarm.update(is_sounding: false)
  end
end
