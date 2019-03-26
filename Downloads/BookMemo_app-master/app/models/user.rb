class User < ApplicationRecord
  mount_uploader :image, MessageImageUploader
  has_one_attached :image
  has_secure_password
    
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :memos
    
end
