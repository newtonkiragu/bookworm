class AddReadingListToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :reading_list, :string
  end
end
