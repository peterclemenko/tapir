class UsersController < ApplicationController

  def show
    @user = User.where(:id => params[:id])
  end

  def index
    @users = User.all
  end

end
