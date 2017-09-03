class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user

  def self.search(search)
   if search
    where('category LIKE ?', "%#{search}%")
   else
    unscoped
   end
  end
end
