class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :picture
      t.string :title
      t.string :author
      t.string :language
      t.string :category
      t.text :description
      t.text :content

      t.timestamps
    end
  end
end
