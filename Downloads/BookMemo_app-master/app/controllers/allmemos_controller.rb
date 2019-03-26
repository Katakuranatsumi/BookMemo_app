class AllmemosController < ApplicationController
 skip_before_action :login_required    
    
  def index
    @memos = Memo.all   
  end

  def show
    @memo = Memo.find(params[:id])  
  end
end
