class Post < ApplicationRecord
  #Relations
  belongs_to :user
  has_one_attached :image
  has_many :hash_tags, through: :post_hash_tags

  #Validation
  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

end
