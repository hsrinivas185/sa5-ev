# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  position   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :bigint
#
# Indexes
#
#  index_players_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
class Player < ApplicationRecord
  belongs_to(
    :team,
    class_name: "Team",
    foreign_key: "team_id",
    inverse_of: :players
  )

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, inclusion: { in: %w[G F] }
end
