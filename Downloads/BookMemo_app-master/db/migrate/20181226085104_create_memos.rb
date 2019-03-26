class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :bookname, limit: 50, null: false
      t.string :author
      t.string :category
      t.text :memo

      t.timestamps
    end
  end
end
