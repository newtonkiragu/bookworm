class AddImpressionsCountToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :impressions_count, :integer
  end
end
