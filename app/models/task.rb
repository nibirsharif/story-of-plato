# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  state        :integer
#  description  :string
#  task_list_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Task < ActiveRecord::Base
  belongs_to :task_list

  enum state: %i[unfinished completed]
end
