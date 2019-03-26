FactoryBot.define do
   factory :memo do
     bookname { '本の名前テスト'}
     memo { '本のメモテスト' }
     user
   end

end