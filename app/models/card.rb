# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  title       :string(288)
#  description :string
#  color       :string
#  user_id     :integer
#  board_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
end
