class ChangeMemoNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :memos, :bookname, false  
  end
end
