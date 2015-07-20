class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  #プロフィール修正画面の表示アクション 
  def edit
  end
  
  #プロフィール修正実行アクション 
  def update
    if @user.update(user_params)
      redirect_to current_user , notice: 'プロフィールを編集しました '
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :age)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
