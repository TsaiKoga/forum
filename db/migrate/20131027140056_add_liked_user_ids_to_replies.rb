class AddLikedUserIdsToReplies < ActiveRecord::Migration
  def change
		add_column :replies, :liked_user_ids, :string 
  end
end
