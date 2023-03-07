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
class Team < ApplicationRecord
  has_many(
    :players,
    class_name: "Player",
    foreign_key: "team_id",
    inverse_of: :team,
    dependent: :destroy
  )
  validates :name, presence: true
  validates :home_city, presence: true
end
