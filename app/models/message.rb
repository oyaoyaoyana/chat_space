class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :body_or_image, presence: true

   mount_uploader :image, ImageUploader



  def show_time
    self.created_at.strftime("%Y/%m/%d %T")
  end

   private

   def body_or_image
     body.presence or image.presence
   end
end
