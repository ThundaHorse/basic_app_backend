class Api::UsersController < ApplicationController

  def index 
    @users = User.all
    render 'index.json.jbuilder'
  end 

  def show 
    @user = User.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def update 
    @user = User.find(params[:id])
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name 
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation

    if @user.save 
      render json: { message: "Updated successfully" }
    else 
      render json: { errors: user.errors.full_messages }
    end 
  end 

  def create 
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save 
      render json: { message: "User created successfully" }, status: 200
    else 
      render json: { message: @user.errors.full_messages }, status: :unprocessable_entity
    end 
  end 

  def destroy 
    @user = User.find(params[:id])
    verification = {
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    }

    if verification[:password] === @user.password && verification[:password_confirmation] === @user.password_confirmation
      @user.delete 
      render json: { message: "User deleted successfully" }
    else 
      render json: { errors: @user.errors.full_messages }
    end 
  end 
end