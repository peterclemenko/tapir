class WelcomeController < ApplicationController

  before_filter :authenticate_user!

  # GET /welcome
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
