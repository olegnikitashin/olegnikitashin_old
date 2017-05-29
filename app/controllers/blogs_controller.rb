class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy, :toggle_status]
  layout 'blog'
  access all: [:show, :index], user: { except: [:new, :create, :update, :edit, :destroy, :toggle_status] }, site_admin: :all

  def index
    @blogs = if logged_in?(:site_admin)
               Blog.recent.page(params[:page]).per(5)
             else
               Blog.published.recent.page(params[:page]).per(5)
             end
  end

  def show
    @blog = Blog.includes(:comments).friendly.find(params[:id])

    if logged_in?(:site_admin) || @blog.published?
      @comment = Comment.new
    else
      flash[:notice] = 'You are not authorized to access this page'
      redirect_to blogs_path
    end
  end

  def new
    @blog = Blog.new
  end

  def edit;
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
      flash[:notice] = 'Blog is published!'
    elsif @blog.published?
      @blog.draft!
      flash[:notice] = 'Blog is in draft mode!'
    end
    redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
