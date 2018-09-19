class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = Sub.find(params[:sub_id]).id
    if @post.save
      redirect_to sub_post_url(@post.sub_id, @post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = post.find(params[:id])
    if @post.update
      redirect_to post_url(@post)
    else
      flash.now[:errors] = ['Dwight you ignorant slut']
      render :edit
    end
  end

  def destroy
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :url, :content)
    end
end
