class AddBookToClub < ActiveRecord::Migration[5.1]
  def change
    add_reference :clubs, :book, foreign_key: true
  end
end
