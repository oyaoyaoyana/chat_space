class Group < ApplicationRecord
  has_many :group_users
  has_many :messages
  has_many :users, through: :group_users


  validates :name, presence: true
  validates :user_ids, presence: true
end
