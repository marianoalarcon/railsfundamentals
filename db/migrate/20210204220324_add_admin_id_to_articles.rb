class AddAdminIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :admin, null: false, foreign_key: true, default: 1
  end
end
