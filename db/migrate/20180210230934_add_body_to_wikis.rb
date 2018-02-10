class AddBodyToWikis < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :title, :string
    add_column :wikis, :body, :text
    add_column :wikis, :created_at, :datetime
    add_column :wikis, :updated_at, :datetime
  end
end
