# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  file_name   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playlist_id :integer
#

class Song < ApplicationRecord
	has_one_attached :song
	belongs_to :playlist

	validates_presence_of :file_name
	validates_uniqueness_of :file_name
end
