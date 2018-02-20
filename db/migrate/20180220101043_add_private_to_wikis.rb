class AddPrivateToWikis < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :private, :boolean
  end
end
