# == Schema Information
#
# Table name: task_lists
#
#  id         :integer          not null, primary key
#  completed  :boolean          default(FALSE)
#  color      :string
#  card_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskList < ActiveRecord::Base
  belongs_to :card
end
