class Post < ApplicationRecord
  #Relations
  belongs_to :user
  has_one_attached :image
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  #Validation
  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  def extract_name_hash_tags
    description.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

  after_commit :create_hash_tags, on: :create

  def create_hash_tags
    # create hash_tags of Post
    extract_name_hash_tags.each do |hash_tag|
      hash_tags.create :name => hash_tag
    end
  end
end
