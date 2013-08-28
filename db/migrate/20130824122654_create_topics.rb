class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :read_num, default: 0
      t.integer :like_num, default: 0
      t.text :content
      t.integer :user_id

      t.timestamps
    end
		add_index :topics, [:user_id, :created_at]
  end
end
