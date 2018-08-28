# == Schema Information
#
# Table name: user_subscriptions
#
#  id                   :integer          not null, primary key
#  status               :integer
#  user_id              :integer
#  subscription_plan_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class UserSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription_plan
end
