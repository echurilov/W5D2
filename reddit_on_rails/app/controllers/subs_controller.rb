class SubsController < ApplicationController
  before_action :require_moderator, only: [:update, :edit, :destroy]
  
  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = ["WRONG"]
      render :edit
    end
      
  end

  def destroy
  end
  

  
  private
    def sub_params
      params.require(:sub).permit(:title, :description)
    end
end
