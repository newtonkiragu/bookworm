class AddClubToBook < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :club, foreign_key: true
  end
end
