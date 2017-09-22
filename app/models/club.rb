class Club < ApplicationRecord
	has_many :users
	has_many :posts
	belongs_to :book
end
