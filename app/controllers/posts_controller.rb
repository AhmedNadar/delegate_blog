class PostsController < ApplicationController
  def index
    @posts = Post.includes(publication: :author).all
  end

  def show
    @post = Post.includes(publication: :author).find(params[:id])
  end
end
