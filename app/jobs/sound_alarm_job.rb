class SoundAlarmJob < ApplicationJob
  queue_as :default

  def perform(alarm)
  	# We will do everything we need to in the tmp directory
  	Dir.chdir('tmp/songs') do
  		playlist = alarm.playlist
	  	playlist.songs.each do |song_model|
	  		# Get the mp3 file from the song model
	  		File.open(song_model.file_name, 'wb') { |f| f.write(song_model.song.download) }
	  		pid = fork { `mplayer #{song_model.file_name} &> /dev/null` }
	  		Process.waitpid(pid)
	  	end
  	end
  end
end
