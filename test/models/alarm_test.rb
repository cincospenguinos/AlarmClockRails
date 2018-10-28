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
  setup do
  	@should_sound = Alarm.create!(playlist: Playlist.first, name: 'Should sound', play_time: Time.now)
  	@not_sound = Alarm.create!(playlist: Playlist.first, name: 'Should not sound', play_time: Time.now + 1.hour)
  end

  teardown do
  	@should_sound.destroy!
  	@not_sound.destroy!
  end

  test 'Alarm at proper time should sound' do
  	assert(@should_sound.is_time?)
  end

  test 'Alarm not at proper time should not sound' do
  	assert_not(@not_sound.is_time?)
  end
end
