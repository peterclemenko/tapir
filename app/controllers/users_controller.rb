class UsersController < ApplicationController

  def show
    @user = Tapir::User.where(:id => params[:id])
  end

  def index
    @users = Tapir::User.all
  end


end
