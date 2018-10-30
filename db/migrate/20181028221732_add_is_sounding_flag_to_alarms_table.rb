class AddIsSoundingFlagToAlarmsTable < ActiveRecord::Migration[5.2]
  def change
  	add_column :alarms, :is_sounding, :boolean
  end
end
