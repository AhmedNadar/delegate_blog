class PostsController < ApplicationController
  def index
    @posts = Post.includes(publication: :author).all
  end

  def show
    @post = Post.includes(publication: :author).find(params[:id])
  end

  def new
    @post = Post.new
    @post.build_publication
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post.publication, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    @post = Post.includes(publication: :author).find(params[:id])
  end

  def update
    @post = Post.includes(publication: :author).find(params[:id])
    if @post.update(post_params)
      redirect_to @post.publication, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:author_id, publication_attributes: [:id, :title, :content, :type])
  end

end
