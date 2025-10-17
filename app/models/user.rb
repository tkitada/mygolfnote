class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :practice_posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :profile_image

  validates :name, presence: :true
  validates :email, presence: :true


end
