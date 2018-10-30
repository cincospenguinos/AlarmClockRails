class AddPidColumnToAlarmsTable < ActiveRecord::Migration[5.2]
  def change
  	add_column :alarms, :song_pid, :integer
  end
end
