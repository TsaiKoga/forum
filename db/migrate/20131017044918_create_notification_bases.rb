class CreateNotificationBases < ActiveRecord::Migration
  def change
    create_table :notification_bases do |t|
			t.integer :user_id
			t.integer :target_id
			t.string :target_type
			t.boolean :read, default: false

      t.timestamps
    end
  end
end
