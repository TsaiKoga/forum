class AddLikedUserIdsToTopics < ActiveRecord::Migration
  def change
		add_column :topics, :liked_user_ids, :string 
		add_column :topics, :replies_count, :integer, :default => 0
  end
end
