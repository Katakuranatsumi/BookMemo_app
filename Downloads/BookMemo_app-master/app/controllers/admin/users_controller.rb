class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end  
    
  def show
    @user = User.find(params[:id])  
  end    
    
  def new
    skip_before_action :login_required
    @user = User.new  
  end
  
  def edit
    @user = User.find(params[:id])  
  end
    
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to login_path, notice: "「#{@user.name}」を新規登録しました。ログインしてサービスをお楽しみください。"    
    else    
      render :new    
    end    
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "「#{@user.name}」のユーザー情報を更新しました"    
    else
      render :new    
    end    
  end
    
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "「#{@user.name}」を削除しました"  
  end      
  
  skip_before_action :login_required    
  def new
    @user = User.new  
  end    
    
  private
 
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation, :image, :introduce)  
  end
    
  private
  def require_admin
    redirect_to root_path unless current_user.admin?  
  end      
end
