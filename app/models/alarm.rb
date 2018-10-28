# == Schema Information
#
# Table name: alarms
#
#  id          :integer          not null, primary key
#  name        :string
#  play_time   :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playlist_id :integer
#

class Alarm < ApplicationRecord
	belongs_to :playlist
	validates_presence_of :name, :play_time

	def is_time?
		now = Time.zone.now.to_a
		time = self.play_time.to_a
		time[1] == now[1] && time[2] == now[2]
	end
end
