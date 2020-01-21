class Api::PostsController < ApplicationController

  def index
    @posts = Post.all 
    render 'index.json.jbuilder'
  end 

  def show 
    @post = Post.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def create 
    @post = Post.new(
      title: params[:title],
      body: params[:body],
      user_id: params[:user_id]
    )
    
    if @post.save 
      render json: { message: "Post created successfully" }, status: 200
    else 
      render json: { message: @post.errors.full_messages }
    end 
  end 

  def update 
    @post = Post.find(params[:id])

    @post.title = params[:title] || @post.title 
    @post.body = params[:body] || @post.body
    @post.user_id = params[:user_id] || @post.user_id

    if @post.save 
      render json: { message: "Updated successfully" }, status: 200 
    else 
      render json: { errors: @post.errors.full_messages }
    end 
  end 

  def destroy 
    @post = Post.find(params[:id])
    @post.delete 
    render json: { message: "Deleted successfully" }
  end 

end
