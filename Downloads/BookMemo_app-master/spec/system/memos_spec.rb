require 'rails_helper'

describe '読書メモ管理機能', type: :system do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')}
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')}
    let!(:memo_a) { FactoryBot.create(:memo, bookname: '最初の読書メモ', user: user_a)}

    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログイン'
    end
    
    shared_examples_for 'ユーザーAが作成した読書メモが表示される' do
      it { expect(page).to have_content '最初の読書メモ' }
    end

    describe '一覧表示機能' do
     context 'ユーザーAがログインしている時' do
        let(:login_user) { user_a }
        
        it_behaves_like 'ユーザーAが作成した読書メモが表示される' 
      end
     
      context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成した読書メモが表示されない' do
        # ユーザーAが作成した読書メモの名称が画面上に表示されていないことを確認
        expect(page).to have_no_content '最初の読書メモ'
      end
    end
   end
   
    describe '詳細表示機能' do
      context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      before do
        visit memo_path(memo_a)
      end

      it_behaves_like 'ユーザーAが作成した読書メモが表示される' 
    end
    end

    describe '新規作成機能' do
      let(:login_user) { user_a }

      before do
        visit new_memo_path
        fill_in '書籍名', with: memo_bookname
        click_button '登録する'
      end
    
    context '新規登録画面で書籍名を入力したとき' do
      let(:memo_bookname) { '新規作成のテストを書く' }

      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: '新規作成のテストを書く'
      end
    end

    context '新規作成画面で名称を入力しなかったとき' do
      let(:memo_bookname) { '' }
 
      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content '書籍名を入力してください'
        end
      end
    end
  end
end