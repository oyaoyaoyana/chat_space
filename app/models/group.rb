class Group < ApplicationRecord
  has_mnany: group_users
  has_many:  messages
  has_many:  users, through: :group_user
end
