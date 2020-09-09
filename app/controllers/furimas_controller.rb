class FurimasController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(furimas_params)
  end

  def destroy
    
  end
  private

  def furimas_params
    params.require(:user).permit(:nickname, :email, :password, :family_name, :family_name_kana, :last_name, :last_name_kana, :birthday, :encrypted_password)
  end
end