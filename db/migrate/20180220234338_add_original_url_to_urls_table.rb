class AddOriginalUrlToUrlsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :original, :string
  end
end
