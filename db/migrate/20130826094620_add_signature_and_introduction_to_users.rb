class AddSignatureAndIntroductionToUsers < ActiveRecord::Migration
  def change
		add_column :users, :introduction, :string
		add_column :users, :signature, :string
  end
end
