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

  has_one :task_list

  has_many :card_referrers, through: :card_referrer_referents, source: :card_referrer
  has_many :card_referrer_referents, foreign_key: "card_referent_id", class_name: "CardReference"

  has_many :card_referents, through: :card_referent_referrers, source: :card_referent
  has_many :card_referent_referrers, foreign_key: "card_referrer_id", class_name: "CardReference"

  def card_color
    @color = self.color
    if self.task_list.present?
      @color = self.task_list.color
      if self.task_list.tasks.all? { |task| task.completed? }
        @color = "#3CFF33"
      end
    end
    @color
  end
end
