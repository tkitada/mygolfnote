class PracticePost < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_one_attached :post_image
  has_rich_text :content

  validates :practice_date, :content, presence: :true
  
  geocoded_by :address #addressカラムの内容を緯度・経度に変換
  after_validation :geocode #バリデーションの実行後にカラムに緯度・経度の値が入力される

  def favorited_by?(user)
    return false unless user
    favorites.exists?(user_id: user.id)
  end

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.post_tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    old_tags.each do |oid_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
    new_tags.uniq.each do |new_name|
      tag = Tag.find_or_create_by(name:new_name)
      self.tags << tag unless self.tags.include?(tag)
    end
  end


end
