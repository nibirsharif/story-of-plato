# == Schema Information
#
# Table name: pricing_plans
#
#  id                :integer          not null, primary key
#  name              :string
#  currency          :string           default("USD")
#  monthly_price     :integer
#  annual_price      :integer
#  additional_charge :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class PricingPlan < ActiveRecord::Base
end
