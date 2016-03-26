class ChangeColumnNameInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :updates_at, :updated_at
    change_column :articles, :updated_at, :datetime
  end
end
