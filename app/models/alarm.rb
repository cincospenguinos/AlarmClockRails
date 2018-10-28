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
		now = Time.zone.now
		now_array = now.to_a
		now_array[2] += 1 unless now.dst?
		play_time.to_a[1] == now_array[1] && play_time.to_a[2] == now_array[2]
	end
end
