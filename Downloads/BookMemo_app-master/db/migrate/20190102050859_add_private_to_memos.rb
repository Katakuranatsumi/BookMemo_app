class AddPrivateToMemos < ActiveRecord::Migration[5.2]
  def change
    add_column :memos, :private, :boolean, default: false, null: false
  end
end
