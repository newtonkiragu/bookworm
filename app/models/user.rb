class User < ApplicationRecord
  has_many :books
  has_many :comments
  has_many :clubs
  mount_uploader :picture, PictureUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable





devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates :name,
          :presence => true,
         :uniqueness => {
           :case_sensitive => false
         }
end
