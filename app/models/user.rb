class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :practice_posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :permits, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :notifications, dependent: :destroy
  
  has_one_attached :profile_image

  validates :name, presence: :true
  validates :email, presence: :true


end
