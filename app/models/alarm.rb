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
end
