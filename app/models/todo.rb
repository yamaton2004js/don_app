class Todo < ApplicationRecord
  default_scope -> { order(start_date_time: :asc) }

  belongs_to :user
  validates :start_date_time, :content, presence: true
end
