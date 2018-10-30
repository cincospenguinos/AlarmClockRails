# == Schema Information
#
# Table name: alarms
#
#  id          :integer          not null, primary key
#  is_sounding :boolean
#  name        :string
#  play_time   :time
#  song_pid    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playlist_id :integer
#

class Alarm < ApplicationRecord
	before_create :adjust_time, :set_defaults
	belongs_to :playlist
	validates_presence_of :name, :play_time

	attr_accessor :adjust_time # A flag that the controller can use to indicate to the model whether or not the time needs to be adjusted

	def play_time_in_zone
		self.play_time + Time.zone_offset(Time.now.zone)
	end

	def is_time?
		now = Time.zone.now.to_a
		time = self.play_time.to_a
		now[1] == time[1] && now[2] == time[2]
	end

	def self.has_one_sounding?
		!Alarm.find_by(is_sounding: true).nil?
	end

	private

	def adjust_time
		self.play_time -= Time.zone_offset(Time.now.zone) if @adjust_time
	end

	def set_defaults
		self.is_sounding ||= false
	end
end
