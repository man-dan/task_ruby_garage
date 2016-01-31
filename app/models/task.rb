class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  default_scope -> { order('id DESC') }
  validates :name, presence: true, length: { minimum: 1, maximum: 300 }
end
