class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :read_num
      t.integer :like_num
      t.text :content
      t.integer :user_id

      t.timestamps
    end
		add_index :topics, [:user_id, :created_at]
  end
end
