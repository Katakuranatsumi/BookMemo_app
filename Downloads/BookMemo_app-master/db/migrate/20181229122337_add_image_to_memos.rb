class AddImageToMemos < ActiveRecord::Migration[5.2]
  def change
    add_column :memos, :image, :string
  end
end

