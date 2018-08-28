# == Schema Information
#
# Table name: organization_subscriptions
#
#  id                   :integer          not null, primary key
#  status               :integer
#  organization_id      :integer
#  subscription_plan_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class OrganizationSubscription < ActiveRecord::Base
  belongs_to :organization
  belongs_to :subscription_plan
end
