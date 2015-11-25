class Micropost < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true, length: {maximum: 140}
  validates :user_id, presence: true
  validate :picture_size

  default_scope ->{order(created_at: :desc)}
  mount_uploader :picture, PictureUploader

  private

  # Validate uploaded picture's size.
  def picture_size
    errors.add(:picture, "should be less than 5MB") if picture.size > 5.megabytes
  end
end
