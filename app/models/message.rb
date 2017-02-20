class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :body, presence: true

  def show_time
    self.created_at.strftime("%D %T")
  end
end
