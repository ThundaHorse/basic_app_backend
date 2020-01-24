class Api::PostsController < ApplicationController
  
  def index
    if current_user 
      @posts = Post.where(user_id: current_user.id)
      render 'index.json.jbuilder'
    else 
      render json: { message: "Sign in to see your posts" }
    end
  end 

  def show 
    if current_user 
      @post = Post.find(params[:id])
      render 'show.json.jbuilder'
    else 
      render json: { message: "Sign in to view post" }
    end
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
    if current_user
      @post = Post.find(params[:id])
      if @post.user_id === current_user.id 
        @post.delete 
        render json: { message: "Deleted successfully" }
      else 
        render json: { message: "This is not your post to delete" }
      end 
    else 
      render json: { message: "Sign in to delete" }
    end
  end 

end
