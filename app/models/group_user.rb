class GroupUser < ApplicationRecord
  validates [:name, :group], presence: true
  belongs_to :group
  belongs_to :user
end
