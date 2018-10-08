class AddPlaylistIdToAlarm < ActiveRecord::Migration[5.2]
  def change
  	add_column :alarms, :playlist_id, :integer
  	remove_column :playlists, :alarm_id
  end
end
