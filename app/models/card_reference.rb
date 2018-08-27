# == Schema Information
#
# Table name: card_references
#
#  id               :integer          not null, primary key
#  card_referrer_id :integer
#  card_referent_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CardReference < ActiveRecord::Base
  belongs_to :card_referrer, class_name: "Card", foreign_key: "card_referrer_id"
  belongs_to :card_referent, class_name: "Card", foreign_key: "card_referent_id"
end
