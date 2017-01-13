class GroupUser < ApplicationRecord
  belongs_to :group, :inverse_of => :group_users
  belongs_to :user
end
