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

require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
