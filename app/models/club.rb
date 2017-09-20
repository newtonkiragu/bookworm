class Club < ApplicationRecord
	has_many :users
	belongs_to :book
end
