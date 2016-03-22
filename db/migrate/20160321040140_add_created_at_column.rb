class AddCreatedAtColumn < ActiveRecord::Migration
  def change
    add_column :articles, :created_at, :datetime
    add_column :articles, :updates_at, :datetime
  end
end
