class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
    
  def index
    @q = current_user.memos.ransack(params[:q])
    @memos = @q.result(distinct: true)
  end

  def show
  end

  def new
    @memo = Memo.new
  end

  def edit
  end
  
  def create 
    @memo = current_user.memos.new(memo_params)
      
    if @memo.save!
    redirect_to @memo, notice: "「#{@memo.bookname}」の登録が完了しました"
    else
    render :new
    end    
  end
    
  def update
    memo = current_user.memos.find(params[:id]) 
    memo.update!(memo_params)
    redirect_to memos_url, notice: "「#{memo.bookname}」のデータを更新しました"
  end
  
  def destroy
    memo = current_user.memos.find(params[:id])  
    memo.destroy
    redirect_to memos_url, notice: "「#{memo.bookname}」を削除しました"
  end
  
  private
    
  def memo_params
    params.require(:memo).permit(:bookname, :author, :category, :memo, :private)  
  end
  
  def set_memo
    @memo = current_user.memos.find(params[:id])  
  end      
end
 