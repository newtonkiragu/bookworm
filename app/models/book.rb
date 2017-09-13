class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  mount_uploader :attachment, AttachmentUploader
  belongs_to :user
  has_many :comments

  acts_as_votable
  has_one :service
  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

  def self.search(search)
   if search
    where('category LIKE ?', "%#{search}%")
   else
    unscoped
   end
  end
end
