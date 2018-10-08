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

require 'test_helper'

class AlarmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
