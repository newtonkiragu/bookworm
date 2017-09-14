class AddBooksToChapters < ActiveRecord::Migration[5.1]
  def change
    add_reference :chapters, :book, foreign_key: true
  end
end
