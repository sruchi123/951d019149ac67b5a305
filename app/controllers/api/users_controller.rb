class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render :json => @users.to_a.as_json
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :json => @user.as_json 
    else
      render :json => @user.errors
    end
  end

  def update
    if @user.update(user_params)
      render :json => @user.as_json 
    else
      render :json => @user.errors
    end
  end

  def show
    if @user.present? 
      render :json => @user.as_json 
    else
      render :json => {error: "User not present With id = #{params[:id]}."}
    end
  end 

  def destroy
    if @user.destroy
      render :json => {}
    else
      render :json => {error: "Error in destroying user."}
    end
  end
  
  def typeahead
    @users = User.search_by_typeahead(params[:input])
    render :json => @users.as_json  
  end

  private

    def set_user
      @user = User.find(params[:id].to_i)
    end

    def user_params
      params.require(:user).permit(:firstName, :lastName, :email)
    end
end
