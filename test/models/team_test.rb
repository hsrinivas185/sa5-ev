# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  home_city  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
