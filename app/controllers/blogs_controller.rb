class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :show, :destroy]
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "投稿完了"
      else
        render :new
      end
    end
  end

  def index
    @blogs = Blog.all
  end

  def show  
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "削除完了"
  end
  
  def edit
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集完了"
    else
      render :new
    end
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  
  
  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
