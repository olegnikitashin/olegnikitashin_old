class PortfoliosController < ApplicationController
  before_action :find_portfolio_item, only: [:show, :edit, :update, :destroy]
  layout 'portfolio'
  access all: [:show, :index], user: { except: [:new, :create, :update, :edit, :destroy, :sort] }, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def show; end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new portfolio_item_params
    if @portfolio_item.save
      flash[:notice] = 'Portfolio was created successfully'
      redirect_to portfolio_show_path(@portfolio_item)
    else
      flash.now[:alert] = 'Portfolio creation failed'
      render :new
    end
  end

  def edit; end

  def update
    if @portfolio_item.update portfolio_item_params
      flash[:notice] = 'Portfolio was updated successfully'
      redirect_to @portfolio_item
    else
      flash.now[:alert] = 'Portfolio update failed'
      render :edit
    end
  end

  def destroy
    if @portfolio_item.destroy
      flash[:notice] = 'Portfolio was deleted successfully'
      redirect_to portfolios_path
    end
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  private

  def find_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_item_params
    params.require(:portfolio).permit(:title, :subtitle, :body,
                                      :main_image, :thumb_image,
                                      technologies_attributes: [:name, :id, :_destroy])
  end
end
