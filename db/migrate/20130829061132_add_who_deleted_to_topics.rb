class AddWhoDeletedToTopics < ActiveRecord::Migration
  def change
		add_column :topics, :who_deleted, :string
  end
end
