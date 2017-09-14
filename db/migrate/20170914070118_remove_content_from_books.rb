class RemoveContentFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :content
  end
end
