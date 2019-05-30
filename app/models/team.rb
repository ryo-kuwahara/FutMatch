class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :messages
         has_many :entries
         has_many :challenges
         has_many :active_friends, class_name: "Friend", foreign_key: "follower_id", dependent: :destroy
         has_many :following, through: :active_friends, source: :followed
         has_many :passive_friends, class_name: "Friend", foreign_key: "followed_id", dependent: :destroy
         has_many :followers, through: :passive_friends, source: :follower
         
         mount_uploader :image, ImageUploader


end
