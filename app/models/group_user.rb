class GroupUser < ApplicationRecord
  validates [:name, :group], presence: true
end
