# == Schema Information
#
# Table name: subscription_plans
#
#  id                :integer          not null, primary key
#  plan_type         :integer
#  subscription_type :integer
#  monthly_cap       :integer
#  pricing_plan_id   :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class SubscriptionPlan < ActiveRecord::Base
  belongs_to :pricing_plan
end
