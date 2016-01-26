class Project < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: { minimum: 1, maximum: 40 }
  validates :user_id, presence: true
end
