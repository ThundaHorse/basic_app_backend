class Api::CommentsController < ApplicationController

  def index 
    @comments = Comment.all 
    render 'index.json.jbuilder'
  end 

  def show 
    @comment = Comment.find(params[:id])
    render 'show.json.jbuilder'
  end 
end
