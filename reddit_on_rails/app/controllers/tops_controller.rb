class TopsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = Sub.find(params[:sub_id]).id
    if @post.save
      redirect_to sub_top_url(@post.sub_id, @post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def update
    @post = post.find(params[:id])
    if @post.update
      redirect_to top_url(@post)
    else
      flash.now[:errors] = ['Dwight you ignorant slut']
      render :edit
    end
  end
end
